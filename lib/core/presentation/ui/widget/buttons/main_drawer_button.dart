import 'package:flutter/material.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

GlobalKey<ScaffoldState> mainScreenKey = GlobalKey<ScaffoldState>();

void controlMainScreenDrawer() {
  if (!mainScreenKey.currentState!.isDrawerOpen) {
    mainScreenKey.currentState!.openDrawer();
  }
}

class MainDrawerButton extends StatelessWidget {
  const MainDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AppSvgIcon(assetName: Assets.icons.drawerIcon, height: 26, width: 26),
      onPressed: () {
        controlMainScreenDrawer();
      },
    );
  }
}
