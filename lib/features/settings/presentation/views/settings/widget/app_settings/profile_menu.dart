import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/arrow_next_icon.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    this.iconData,
    this.iconSvg,
    this.isLast = false,
    this.isLoginRequired = false,
    this.press,
  });

  final bool isLoginRequired;
  final String text;
  final String? iconSvg;
  final IconData? iconData;
  final VoidCallback? press;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    double iconSize = 22;
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: context.colors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      ),
      onPressed: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              iconData != null
                  ? Icon(
                      iconData,
                      size: iconSize,
                      color: context.themeValue(
                        light: context.colors.primary,
                        dark: Colors.white,
                      ),
                    )
                  : SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: AppSvgIcon(
                        assetName: iconSvg!,
                        fit: BoxFit.contain,
                      ),
                    ),
              const SizedBox(width: 20),
              Expanded(child: Text(text, style: context.textTheme.labelLarge!)),
              ArrowNextIcon(size: SizeIcon.SIZE_18),
              // Icon(
              //   Icons.arrow_forward_ios,
              //   size: 18,
              //   color: context.colors.blackOrWhite.withAlphaOpacity(0.6),
              // ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            width: double.infinity,
            height: 0.1,
            color: isLast
                ? null
                : context.colors.blackOrWhite.withAlphaOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
