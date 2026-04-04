import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class PullToRefreshFooter extends StatelessWidget {
  const PullToRefreshFooter({super.key, required this.loadingWidget});

  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 70,
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;

        if (mode == LoadStatus.idle) {
          body = Text(
            Strings.drop_up_to_upload_more.tr(),
            style: context.textTheme.bodySmall,
          );
        } else if (mode == LoadStatus.loading) {
          body = loadingWidget;
        } else if (mode == LoadStatus.failed) {
          body = Text(
            Strings.load_faild.tr(),
            style: context.textTheme.bodySmall,
          );
        } else if (mode == LoadStatus.canLoading) {
          body = Text(
            Strings.leave_screen_to_load.tr(),
            style: context.textTheme.bodySmall,
          );
        } else {
          body = Text(
            Strings.seem_you_reach_end.tr(),
            style: context.textTheme.bodySmall,
          );
        }
        return SizedBox(child: Center(child: body));
      },
    );
  }
}
