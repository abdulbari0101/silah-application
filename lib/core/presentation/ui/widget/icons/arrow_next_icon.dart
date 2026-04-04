import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

enum SizeIcon {
  SIZE_16(16),
  SIZE_18(18),
  SIZE_20(20),
  SIZE_24(24),
  SIZE_28(28),
  SIZE_32(32);

  final double value;

  const SizeIcon(this.value);
}

class ArrowNextIcon extends StatelessWidget {
  const ArrowNextIcon({
    super.key,
    this.size = SizeIcon.SIZE_16,
    this.useSvg = false,
    this.color,
    this.icon,
  });

  final SizeIcon size;
  final bool useSvg;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final defColor = context.colors.isDark
        ? context.colors.onSurface
        : context.colors.onSurfaceVariant;
    final iconColor = color ?? defColor;
    final iconD = icon ?? Icons.arrow_forward_ios;

    return useSvg ? _buildSvgIcon() : _buildMaterialIcon(iconD, iconColor);
  }

  Widget _buildMaterialIcon(IconData icon, Color color) {
    //print("buildMaterialIcon--------------------->color: " + color.asHexString);
    return Icon(icon as IconData?, size: size.value, color: color);
  }

  Widget _buildSvgIcon() {
    return AppSvgIcon(
      assetName: Assets.icons.navigation.icArrowNext,
      width: size.value, // def 32
      height: size.value, // def 32
    );
  }
}
