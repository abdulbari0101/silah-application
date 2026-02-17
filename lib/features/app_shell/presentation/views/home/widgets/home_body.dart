import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/overlays/toasts.dart';
import 'package:silah_app/core/presentation/ui/widget/pull_to_refresh/pull_to_refresh_header.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';
import 'package:silah_app/features/app_shell/presentation/blocs/home_bloc/home_bloc.dart';

import 'home_greeting_card.dart';
import 'home_logout_section.dart';
import 'home_status_card.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                UIConstants.xbigHeight,
                const HomeGreetingCard(),
                UIConstants.bigHeight,
                const HomeStatusCard(),
                UIConstants.xbigHeight,
                const HomeLogoutSection(),
                UIConstants.bigHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
