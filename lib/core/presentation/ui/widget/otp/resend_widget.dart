import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/otp/resend_timer.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/ios_progress.dart';

class ResendWidget extends StatefulWidget {
  final bool isLouding;

  final void Function()? onTap;
  const ResendWidget({super.key, required this.isLouding, this.onTap});

  @override
  State<ResendWidget> createState() => _ResendWidgetState();
}

class _ResendWidgetState extends State<ResendWidget> {
  int _secondsRemaining = UIConstants.resendCountdownSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _secondsRemaining = UIConstants.resendCountdownSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.textTheme.labelLarge;
    final accentColor = context.colors.primary;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.not_receive_code.tr(), style: themeStyle),
        UIConstants.smallWidth,
        if (widget.isLouding)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: IOSProgress(size: 10),
          )
        else
          _secondsRemaining > 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResendTimer(secondsRemaining: _secondsRemaining),
                )
              : _resendButton(themeStyle!, accentColor),
      ],
    );
  }

  Widget _resendButton(TextStyle themeStyle, Color accentColor) {
    return InkWell(
      splashColor: context.colors.primary,
      borderRadius: context.shapes.brSm,
      onTap: () {
        widget.onTap?.call();
        _startCountdown();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.resend.tr(),
              style: themeStyle.copyWith(color: accentColor),
            ),
            const SizedBox(width: 4),
            Icon(Icons.refresh, size: 14, color: context.colors.primary),
          ],
        ),
      ),
    );
  }
}
