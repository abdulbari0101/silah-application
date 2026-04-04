import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/ui_error_bus.dart';

import 'ui_error_overlay.dart';

/// NOTE: This host must live **under** a MaterialApp/CupertinoApp
/// (we rely on ScaffoldMessenger/Theme).
class UiErrorHost extends StatefulWidget {
  const UiErrorHost({super.key, required this.child, this.onRetry});
  final Widget child;
  final Future<void> Function()? onRetry;

  @override
  State<UiErrorHost> createState() => _UiErrorHostState();
}

class _UiErrorHostState extends State<UiErrorHost> {
  // Ensures only a single live listener across the whole app.
  static bool _attached = false;

  StreamSubscription<UiError>? _sub;
  UiError? _current;
  bool _isPrimary = false;

  // simple de-dupe
  UiError? _last;
  DateTime _lastAt = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void initState() {
    super.initState();

    // First host that mounts becomes the primary listener.
    if (!_attached) {
      _attached = true;
      _isPrimary = true;

      _sub = UiErrorBus.i.stream.listen((e) {
        final now = DateTime.now();
        final isDup =
            _last != null &&
            e.title == _last!.title &&
            e.message == _last!.message &&
            now.difference(_lastAt).inMilliseconds < 800;

        if (!isDup && mounted) {
          _last = e;
          _lastAt = now;
          setState(() => _current = e);
        }
      });
    } else {
      // Not primary → pass-through wrapper, no subscription.
      _isPrimary = false;
    }
  }

  @override
  void dispose() {
    // Only the primary host owns the subscription and the attach flag.
    if (_isPrimary) {
      _sub?.cancel();
      _attached = false;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Must be under a WidgetsApp (MaterialApp/CupertinoApp). Keep it cheap in debug.

    if (!_isPrimary) return widget.child;

    return Stack(
      children: [
        widget.child,
        if (_current != null)
          Positioned.fill(
            child: UiErrorOverlay(
              title: "Something went wrong",
              message: "An unexpected error occurred.",
              detailsProvider: () => _current!.details,
              onRetry: () async {
                AppLogger().uiInfo('UI Retry clicked', tag: 'ui_error');
                setState(() => _current = null);
                await widget.onRetry?.call();
              },
              onReport: () async {
                AppLogger().uiInfo('UI Report clicked', tag: 'ui_error');
                try {
                  if (kReleaseMode) {
                    await FirebaseCrashlytics.instance.recordError(
                      _current!.error,
                      _current!.stack,
                      fatal: false,
                      reason: 'User-reported UI error',
                    );
                  }
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Report sent')),
                    );
                  }
                } catch (_) {}
              },
              onClose: () => setState(() => _current = null),
            ),
          ),
      ],
    );
  }
}
