import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/back_button.dart';

class AndroidAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AndroidAppBar({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.fontSize = UIConstants.appBarTitleFontSize,
    this.height = kToolbarHeight,
    this.backgroundColor,
  });
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double height;
  final double fontSize;

  /// Optional background color for Android screen.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: CustomeBackButton(
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
