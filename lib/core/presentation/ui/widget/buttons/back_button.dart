import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class CustomeBackButton extends StatelessWidget {
  final Function()? onPressed;
  final double size;
  const CustomeBackButton({super.key, this.onPressed, this.size = 22});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AppSvgIcon(assetName: Assets.icons.navigation.back, darkDynamicColor: false),

      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}
