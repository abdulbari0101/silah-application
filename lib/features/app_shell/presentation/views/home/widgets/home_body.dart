import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/pull_to_refresh/pull_to_refresh_header.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:silah_app/features/app_shell/presentation/views/main/widget/navigation/nav_items_builder.dart';
import 'package:silah_app/features/consultations/presentation/cubits/requests/consultation_requests_cubit.dart';

import 'home_ai_prompt_card.dart';
import 'home_carousel_dots.dart';
import 'home_current_requests_section.dart';
import 'home_greeting_card.dart';
import 'home_logout_section.dart';
import 'home_quick_actions.dart';
import 'home_search_bar.dart';
import 'home_status_card.dart';
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
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

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
      (bloc) => (bloc.state.data.customer?.profile?['isTrainee'] as bool?) ?? false,
    );
    final role = context.select<AppStateBloc, AppUserRole>(
      (bloc) => resolveAppUserRole(bloc.state.data.customer),
    );
    final showTraineePrompt = role == AppUserRole.user && !isTrainee;

    final content = role == AppUserRole.user
        ? BlocProvider(
            create: (_) => ConsultationRequestsCubit(repository: locator())..load(),
            child: _UserHomeContent(showTraineePrompt: showTraineePrompt),
          )
        : _DefaultHomeContent(showTraineePrompt: showTraineePrompt);

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
      child: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: const PullToRefershHeader(),
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ScreenPaddingWrapper(
            child: content,
          ),
        ),
      ),
    );
  }
}

class _DefaultHomeContent extends StatelessWidget {
  const _DefaultHomeContent({required this.showTraineePrompt});

  final bool showTraineePrompt;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UIConstants.xbigHeight,
        const HomeGreetingCard(),
        UIConstants.bigHeight,
        const HomeQuickActions(),
        if (showTraineePrompt) ...[
          UIConstants.bigHeight,
          const HomeTraineePromptCard(),
        ],
        UIConstants.bigHeight,
        const HomeStatusCard(),
        UIConstants.xbigHeight,
        const HomeLogoutSection(),
        UIConstants.bigHeight,
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
        UIConstants.bigHeight,
        const HomeUserHeader(),
        UIConstants.bigHeight,
        const HomeSearchBar(),
        UIConstants.bigHeight,
        const HomeAiPromptCard(),
        UIConstants.smallHeight,
        const HomeCarouselDots(),
        if (showTraineePrompt) ...[
          UIConstants.bigHeight,
          const HomeTraineePromptCard(),
        ],
        UIConstants.bigHeight,
        const HomeCurrentRequestsSection(),
        UIConstants.xbigHeight,
        const HomeLogoutSection(),
        UIConstants.bigHeight,
      ],
    );
  }
}
