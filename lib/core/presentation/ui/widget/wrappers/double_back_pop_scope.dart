import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/infrastructure/platform/app_platform.dart';

class DoubleBackPopScope extends StatefulWidget {
  const DoubleBackPopScope({
    super.key,
    required this.child,
    this.interval = const Duration(seconds: 2),
    this.snackBarMessage,
    this.onDoubleTapped,
  });

  final Widget child;

  final Function()? onDoubleTapped;
  final Duration interval;
  final String? snackBarMessage;

  @override
  State<DoubleBackPopScope> createState() => _DoubleBackPopScopeState();
}

class _DoubleBackPopScopeState extends State<DoubleBackPopScope> {
  DateTime? _lastPressed;

  Future<void> _handleBack(BuildContext context, bool didPop) async {
    if (didPop) return;

    final now = DateTime.now();
    final tappedTwice =
        _lastPressed != null && now.difference(_lastPressed!) < widget.interval;

    if (tappedTwice) {
      if (!AppPlatform.isIOS) {
        if (widget.onDoubleTapped != null) {
          widget.onDoubleTapped!();
        }
        await SystemNavigator.pop();
      } else {
        // iOS / desktop fallback
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).maybePop();
        }
      }
    } else {
      _lastPressed = now;
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.snackBarMessage ?? Strings.press_again_to_exit.tr(),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) => _handleBack(context, didPop),
      child: widget.child,
    );
  }
}
