import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/ios_progress.dart';

class PullToRefershHeader extends StatelessWidget {
  const PullToRefershHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return WaterDropHeader(
      refresh: const IOSProgress(size: 10),

      waterDropColor: context.themeValue(
        dark: context.colors.primary,
        light: context.colors.primary,
      ),

      complete: Text(
        Strings.refresh_done.tr(),
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
