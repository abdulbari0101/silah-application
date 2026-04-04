import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class IOSAppBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const IOSAppBar({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.fontSize = 19,
    this.height = UIConstants.kioskToolBarHeight,
  });
  final String title;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          : const SizedBox(),
      middle: Text(
        title,
        style: context.textTheme.labelLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
      ),
      trailing: actions == null
          ? const SizedBox()
          : Row(mainAxisSize: MainAxisSize.min, children: [...actions!]),
      backgroundColor: context.colors.surface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
