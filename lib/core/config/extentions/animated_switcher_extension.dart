import 'package:flutter/material.dart';

extension AnimatedSwitcherX on Widget {
  Widget withAnimatedSwitcher() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: KeyedSubtree(
        key: ValueKey(toString()),
        child: this,
      ),
    );
  }
}