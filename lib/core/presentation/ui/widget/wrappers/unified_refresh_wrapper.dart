import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class UnifiedRefreshWrapper extends StatelessWidget {
  final Widget child;

  const UnifiedRefreshWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => MaterialClassicHeader(
        color: context.colors.primary,
        backgroundColor: context.colors.primary,
      ),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: true,
      shouldFooterFollowWhenNotFull: (status) => false,
      child: child,
    );
  }
}
