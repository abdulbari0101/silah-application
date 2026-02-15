import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/screen/tabs_screen/utils/tab_view.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';

class TabButtonItem extends StatelessWidget {
  final TabView tab;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButtonItem({
    super.key,
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = !tab.isEnabled;

    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              onTap();

              if (tab.onSelect != null) {
                tab.onSelect!.call();
              }
            },
      child: Opacity(
        opacity: isDisabled ? 0.4 : 1.0,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            final isEntering = child.key == const ValueKey("selected");

            return AnimatedBuilder(
              animation: animation,
              builder: (context, childWidget) {
                final scale = isEntering
                    ? animation
                          .value // zoom in
                    : 1.0 - (0.1 * animation.value); // slight shrink
                final opacity = animation.value.clamp(0.0, 1.0);

                return Transform.scale(
                  scale: scale,
                  child: Opacity(opacity: opacity, child: childWidget),
                );
              },
              child: child,
            );
          },
          child: Container(
            key: ValueKey(isSelected ? "selected" : "unselected-${tab.title}"),
            height: 35,
            width: AppDimension(context).width / 2.31,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? context.colors.surfaceContainer : Colors.transparent,
              borderRadius: context.shapes.brSm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (tab.tabIcon != null) ...[
                  AppSvgIcon(assetName: tab.tabIcon!),
                  const SizedBox(width: 6),
                ],
                Text(
                  tab.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    color: isSelected ? context.colors.onSurface : context.colors.greyDark(),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
