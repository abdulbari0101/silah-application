import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/headers/curved_header_container.dart';
import 'package:silah_app/core/presentation/ui/widget/pull_to_refresh/pull_to_refresh_header.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/consultations/domain/entities/consultation_status.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';

import 'home_admin_dashboard.dart';
import 'home_ai_prompt_card.dart';
import 'home_current_requests_section.dart';
import 'home_search_bar.dart';
import 'home_lawyer_dashboard.dart';
import 'home_trainee_prompt_card.dart';
import 'home_user_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeContent();
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    context.read<HomeBloc>().add(const RefreshHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    final isTrainee = context.select<AppStateBloc, bool>(
      (bloc) =>
          (bloc.state.data.customer?.profile?['isTrainee'] as bool?) ?? false,
    );
    final role = context.select<AppStateBloc, AppUserRole>(
      (bloc) => resolveAppUserRole(bloc.state.data.customer),
    );
    final showTraineePrompt = role == AppUserRole.user && !isTrainee;

    return MultiBlocListener(
      listeners: [
        // Control pull-to-refresh based on HomeBloc state
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeRefreshed) {
              _refreshController.refreshCompleted();
            } else if (state is HomeRefreshError) {
              _refreshController.refreshFailed();
              Toasts.error(context, state.message);
            }
          },
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          final content = switch (role) {
            AppUserRole.user => BlocProvider(
              key: ObjectKey(homeState),
              create: (_) => ConsultationRequestsCubit(
                repository: locator(),
                initialFilter: ConsultationStatus.accepted,
              )..load(),
              child: _UserHomeContent(showTraineePrompt: showTraineePrompt),
            ),
            AppUserRole.lawyer => _LawyerHomeContent(key: ObjectKey(homeState)),
            AppUserRole.admin => _AdminHomeContent(key: ObjectKey(homeState)),
          };

          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: const PullToRefershHeader(),
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ScreenPaddingWrapper(fullWidth: true, child: content),
            ),
          );
        },
      ),
    );
  }
}

class _LawyerHomeContent extends StatelessWidget {
  const _LawyerHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurvedHeaderContainer(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.mediumPadding,
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
          ),
          child: const HomeUserHeader(),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
            UIConstants.screenHorizantalPadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [const HomeLawyerDashboard(), UIConstants.xbigHeight],
          ),
        ),
      ],
    );
  }
}

class _AdminHomeContent extends StatelessWidget {
  const _AdminHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurvedHeaderContainer(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.mediumPadding,
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
          ),
          child: const HomeUserHeader(),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
            UIConstants.screenHorizantalPadding,
            0,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [HomeAdminDashboard(), UIConstants.xbigHeight],
          ),
        ),
      ],
    );
  }
}

class _UserHomeContent extends StatelessWidget {
  const _UserHomeContent({required this.showTraineePrompt});

  final bool showTraineePrompt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CurvedHeaderContainer(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.mediumPadding,
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
          ),
          child: const HomeUserHeader(),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(
            UIConstants.screenHorizantalPadding,
            UIConstants.bigPadding,
            UIConstants.screenHorizantalPadding,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeSearchBar(
                onTap: () {
                  context.pushNamed(AppRoutes.searchFilter.name);
                },
              ),
              UIConstants.bigHeight,
              const HomeAiPromptCard(),
              // UIConstants.smallHeight,
              // const HomeCarouselDots(),
              if (showTraineePrompt) ...[
                UIConstants.bigHeight,
                const HomeTraineePromptCard(),
              ],
              UIConstants.bigHeight,
              const HomeCurrentRequestsSection(),
              UIConstants.xbigHeight,
            ],
          ),
        ),
      ],
    );
  }
}
