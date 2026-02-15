import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/router/app_routes.dart';

import '../helper/callback_registry.dart';
import 'key_extra.dart';

class SuccessNavigatorHelper {
  static void pushSuccess({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String buttonLabel,
    VoidCallback? onTap,
    String? prefixKeyFirst,
    String? secondButtonLabel,
    VoidCallback? onSecondTap,
    bool secondButton = false,
    String? prefixKeySecond,
  }) {
    String generateKey([String prefix = 'callback']) =>
        '${prefix}_${DateTime.now().millisecondsSinceEpoch}';

    String? onTapId;
    if (onTap != null) {
      onTapId = generateKey(prefixKeyFirst ?? 'onTap');
      CallbackRegistry.register(onTapId, onTap);
    }

    String? onSecondTapId;
    if (onSecondTap != null) {
      onSecondTapId = generateKey(prefixKeySecond ?? 'onSecondTap');
      CallbackRegistry.register(onSecondTapId, onSecondTap);
    }

    context.pushNamed(
      AppRoutes.success.name,
      extra: {
        KeyExtra.title: title,
        KeyExtra.subtitle: subtitle,
        KeyExtra.buttonLabel: buttonLabel,
        if (onTapId != null) KeyExtra.onTapId: onTapId,
        KeyExtra.secondButton: secondButton,
        if (secondButtonLabel != null) KeyExtra.secondButtonLabel: secondButtonLabel,
        if (onSecondTapId != null) KeyExtra.onSecondTapId: onSecondTapId,
      },
    );
  }
}
