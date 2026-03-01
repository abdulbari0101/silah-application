import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class CustomeBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;

  const CustomeBackButton({super.key, this.onPressed, this.size = 20});

  @override
  Widget build(BuildContext context) {
    final background = context.colors.surfaceContainerHighest;
    final border = context.colors.outlineVariant.withAlphaOpacity(0.4);

    return Material(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: border),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Center(
            child: AppSvgIcon(
              assetName: Assets.icons.navigation.back,
              darkDynamicColor: false,
              width: size,
              height: size,
            ),
          ),
        ),
      ),
    );
  }
}
