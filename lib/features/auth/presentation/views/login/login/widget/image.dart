import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class LoginImge extends StatelessWidget {
  const LoginImge({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppSvgIcon(
        assetName: Assets.icons.logo.logoSvg,
        matchTextDirection: false,
        darkDynamicColor: false,
      ),
    );
  }
}
