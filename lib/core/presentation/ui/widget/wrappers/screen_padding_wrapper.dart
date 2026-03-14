import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';

/// A wrapper widget to ensure consistent spacing across screens.
///
/// This handles:
/// - Default horizontal padding (e.g., 16px)
/// - Optional bottom spacing only for vertical
/// - Exception cases like widgets needing only one-sided padding (e.g., Offer)
class ScreenPaddingWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsDirectional? padding;
  final bool onlyStartPadding;
  final bool onlyEndPadding;
  final bool fullWidth;
  final bool fullHeight;

  const ScreenPaddingWrapper({
    super.key,
    required this.child,
    this.padding,
    this.onlyStartPadding = false,
    this.onlyEndPadding = false,
    this.fullWidth = false,
    this.fullHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      !(onlyStartPadding && onlyEndPadding),
      'Cannot use onlyStartPadding and onlyEndPadding together.',
    );

    final defaultHorizontalPadding = UIConstants.screenHorizantalPadding;
    final defaultVerticalPadding = UIConstants.screenHorizantalPadding;

    double start = 0, end = 0, bottom = defaultVerticalPadding;

    if (!fullWidth && !onlyEndPadding) start = defaultHorizontalPadding;
    if (!fullWidth && !onlyStartPadding) end = defaultHorizontalPadding;

    final effectivePadding = EdgeInsetsDirectional.fromSTEB(
      start,
      0,
      end,
      bottom,
    );

    final wrappedChild = Padding(padding: effectivePadding, child: child);

    return wrappedChild;
  }
}
