import 'dart:ui' as ui;
import 'dart:ui' show ImageFilter, Offset; // For Cupertino filter & anchorPoint

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';

class AdaptiveBottomSheet {
  const AdaptiveBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder, // Material body
    WidgetBuilder? cupertinoBuilder, // Optional iOS body
    //  Shared
    Color? barrierColor,
    String? barrierLabel,
    Offset? anchorPoint,
    RouteSettings? routeSettings,
    bool? useRootNavigator,
    bool resizeToAvoidBottomInset = true,
    // Material‑specific
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = true,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    ShapeBorder? shape,
    double? elevation,
    Color? backgroundColor,
    AnimationController? transitionAnimationController,
    AnimationStyle? sheetAnimationStyle,
    double scrollControlDisabledMaxHeightRatio = 0.9,

    //Cupertino‑specific
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
    ImageFilter? filter,
  }) {
    // iOS / Cupertino path

    if (AppPlatform.isIOS && cupertinoBuilder != null) {
      // if (false) {
      return showCupertinoModalPopup<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        semanticsDismissible: semanticsDismissible,
        useRootNavigator: false, // match Material side, not false
        routeSettings: routeSettings,
        filter: filter,
        anchorPoint: anchorPoint,
        builder: cupertinoBuilder ?? builder,
        // builder: (ctx) {
        //   final content = (cupertinoBuilder)(ctx);

        //   return _CupertinoSheet(
        //     child: content,
        //     backgroundColor: backgroundColor, // let caller override if needed
        //     resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        //   );
        // },
      );
    }

    // Android / Material

    return showModalBottomSheet<T>(
      context: context,
      // backgroundColor: backgroundColor ?? Colors.transparent,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      useRootNavigator: useRootNavigator ?? AppPlatform.isIOS ? false : true,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      showDragHandle: showDragHandle,
      barrierLabel: barrierLabel,
      clipBehavior: clipBehavior,
      constraints: constraints,
      shape: shape,
      elevation: elevation,
      anchorPoint: anchorPoint,
      transitionAnimationController: transitionAnimationController,
      routeSettings: routeSettings,
      useSafeArea: useSafeArea,
      sheetAnimationStyle: sheetAnimationStyle,
      builder: (ctx) {
        // Automatic keyboard inset handling.
        // final bottomInset = mediaQuery.viewInsets.bottom;
        Widget body = builder(ctx);
        if (resizeToAvoidBottomInset) {
          final mediaQuery = MediaQuery.of(ctx);
          body = AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
            child: body,
          );
        }

        // Optional M3 drag handle already injected by showModalBottomSheet when
        // `showDragHandle` is true. We only need to wrap SafeArea & blur.
        if (!useSafeArea) {
          body = SafeArea(top: false, child: body);
        }
        return _BlurredSheet(child: body);
      },
    );
  }
}

//
// Helper: Frosted‑glass container for Material path.
//
class _BlurredSheet extends StatelessWidget {
  const _BlurredSheet({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: BackdropFilter(filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20), child: child),
    );
  }
}

// class _CupertinoSheet extends StatelessWidget {
//   const _CupertinoSheet({
//     required this.child,
//   });

//   final Widget child;
//   final Color? backgroundColor;
//   final bool resizeToAvoidBottomInset;

//   Color _resolveSheetColor(BuildContext context) {
//     if (backgroundColor != null) return backgroundColor!;
//     // Prefer Material color scheme if app is Material-first:
//     final cs = Theme.of(context).colorScheme;
//     final base = cs.brightness == Brightness.dark
//         ? cs.surfaceContainer
//         : cs.surfaceContainerLow; // matches your ContainerLow* token
//     return base.withAlphaOpacity(0.94);
//     // Alternatively, pure Cupertino:
//     // return CupertinoColors.systemBackground.resolveFrom(context).withOpacity(0.94);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget body = child;
//     if (resizeToAvoidBottomInset) {
//       final bottomInset = MediaQuery.of(context).viewInsets.bottom;
//       body = AnimatedPadding(
//         duration: const Duration(milliseconds: 150),
//         curve: Curves.easeOut,
//         padding: EdgeInsets.only(bottom: bottomInset),
//         child: body,
//       );
//     }

//     return SafeArea(
//       top: false,
//       child: ClipRRect(
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//         child: BackdropFilter(
//           filter: ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//           child: DecoratedBox(
//             decoration: BoxDecoration(color: _resolveSheetColor(context)),
//             child: body,
//           ),
//         ),
//       ),
//     );
//   }
// }
