import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/platform_screen_wrapper.dart';

class AuthCurvedScaffold extends StatelessWidget {
  final Widget header;
  final Widget child;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final double headerRadius;

  const AuthCurvedScaffold({
    super.key,
    required this.header,
    required this.child,
    this.headerPadding,
    this.bodyPadding,
    this.headerRadius = 36,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final background = scheme.surface;
    final headerColor = scheme.surfaceContainerHighest;
    final viewInsets = MediaQuery.of(context).viewInsets;
    final themedBody = LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: viewInsets.bottom),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      headerPadding ??
                      const EdgeInsets.fromLTRB(
                        UIConstants.screenHorizantalPadding,
                        UIConstants.bigPadding,
                        UIConstants.screenHorizantalPadding,
                        UIConstants.bigPadding,
                      ),
                  decoration: BoxDecoration(
                    color: headerColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(headerRadius),
                    ),
                  ),
                  child: header,
                ),
                Padding(
                  padding:
                      bodyPadding ??
                      const EdgeInsets.fromLTRB(
                        UIConstants.screenHorizantalPadding,
                        UIConstants.bigPadding,
                        UIConstants.screenHorizantalPadding,
                        UIConstants.bigPadding,
                      ),
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );

    return PlatformScreenWrapper(
      androidBackgroundColor: background,
      iosBackgroundColor: background,
      body: themedBody,
    );
  }
}
