import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/gen/assets.gen.dart';

class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({
    this.lightAsset,
    this.darksAsset,
    required this.message,
    this.height,
    this.width,
    this.onRetry,
    super.key,
  });
  final String message;
  final String? lightAsset;
  final String? darksAsset;
  final Function()? onRetry;

  final double? height;
  final double? width;

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
            flex: 2,
            child: Lottie.asset(
              context.themeValue(
                dark: (darksAsset ?? lightAsset) ?? Assets.lottie.cat,
                light: (lightAsset ?? darksAsset) ?? Assets.lottie.cat,
              ),
              height: height ?? 300,
              width: width ?? 300,
              fit: BoxFit.contain,
              repeat: true,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(message, style: context.textTheme.bodyMedium, textAlign: TextAlign.center),
                UIConstants.smallHeight,
                InkWell(
                  onTap: onRetry,
                  splashColor: context.colors.primary,
                  borderRadius: context.shapes.brLg,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Strings.try_again.tr(), style: context.textTheme.bodyMedium),
                        UIConstants.xxsmallWidth,
                        Icon(CupertinoIcons.restart, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
