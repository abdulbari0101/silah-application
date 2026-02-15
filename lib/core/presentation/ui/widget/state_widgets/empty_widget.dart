import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.height, this.width, this.title, this.retryWidget});

  final double? height;
  final double? width;
  final Widget? retryWidget;

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != null ? height! + 80 : AppDimension(context).height / 1.5,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Lottie.asset(
              context.themeValue(light: Assets.lottie.empty1, dark: Assets.lottie.empty1),
              height: height ?? 200,
              fit: BoxFit.contain,
              width: width ?? 200,
              repeat: true,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(title ?? Strings.no_data_to_display.tr(), style: context.textTheme.bodyMedium),
                UIConstants.smallHeight,
                if (retryWidget != null) retryWidget!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
