import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/extentions/map_extras_extension.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';

import '../../../../../config/router/app_routes.dart';
import 'callback_registry.dart';
import 'success_screen_keys.dart';

class SuccessScreenArgs {
  final String title;
  final String subtitle;
  final String primaryButtonLabel;
  final bool showSecondaryButton;
  final String? secondaryButtonLabel;
  final VoidCallback? onPrimaryTap;
  final VoidCallback? onSecondaryTap;
  final String? onPrimaryRoute;
  final String? transactionNumber;
  final bool showShareButton;
  final String? shareButtonLabel;
  final VoidCallback? onShareTap;
  final VoidCallback? onPostFrame;

  const SuccessScreenArgs({
    required this.title,
    required this.subtitle,
    required this.primaryButtonLabel,
    this.showSecondaryButton = false,
    this.secondaryButtonLabel,
    this.onPrimaryTap,
    this.onPrimaryRoute,
    this.transactionNumber,
    this.showShareButton = false,
    this.shareButtonLabel,
    this.onSecondaryTap,
    this.onShareTap,
    this.onPostFrame,
  });
}

class SuccessScreenBuilder {
  static Map<String, dynamic> build(SuccessScreenArgs args) {
    final Map<String, dynamic> extra = {
      SuccessScreenKeys.title: args.title,
      SuccessScreenKeys.subtitle: args.subtitle,
      SuccessScreenKeys.primaryButtonLabel: args.primaryButtonLabel,
      SuccessScreenKeys.secondButton: args.showSecondaryButton,
      SuccessScreenKeys.onPrimaryRoute: args.onPrimaryRoute,
    };

    if (args.secondaryButtonLabel != null) {
      extra[SuccessScreenKeys.secondButtonLabel] = args.secondaryButtonLabel;
    }

    if (args.onPrimaryTap != null) {
      final id = 'primaryTap_${DateTime.now().millisecondsSinceEpoch}';
      CallbackRegistry.register(id, args.onPrimaryTap!);
      extra[SuccessScreenKeys.onTapId] = id;
    }

    if (args.onSecondaryTap != null) {
      final id = 'secondaryTap_${DateTime.now().millisecondsSinceEpoch}';
      CallbackRegistry.register(id, args.onSecondaryTap!);
      extra[SuccessScreenKeys.onSecondTapId] = id;
    }

    if (args.transactionNumber != null) {
      extra[SuccessScreenKeys.transactionNumber] = args.transactionNumber;
    }

    if (args.showShareButton) {
      extra[SuccessScreenKeys.shareButton] = true;
    }

    if (args.shareButtonLabel != null) {
      extra[SuccessScreenKeys.shareButtonLabel] = args.shareButtonLabel;
    }

    if (args.onShareTap != null) {
      final id = 'shareTap_${DateTime.now().millisecondsSinceEpoch}';
      CallbackRegistry.register(id, args.onShareTap!);
      extra[SuccessScreenKeys.onShareTapId] = id;
    }

    if (args.onPostFrame != null) {
      final id = 'postFrame_${DateTime.now().millisecondsSinceEpoch}';
      CallbackRegistry.register(id, args.onPostFrame!);
      extra[SuccessScreenKeys.onPostFrameTapId] = id;
    }

    return extra;
  }

  static SuccessScreenArgs fromContext(BuildContext context) {
    final extraRaw = GoRouterState.of(context).extra;

    if (extraRaw == null || extraRaw is! Map<String, dynamic>) {
      throw FlutterError(
        '[SuccessScreenBuilder] Missing or invalid route data.\n\n'
        'Make sure you navigated using `SuccessScreenBuilder.build(...)` '
        'and passed the result via `extra:` parameter in your navigation call.\n\n'
        'Example:\n'
        'context.pushTo(AppRoutes.success, extra: SuccessScreenBuilder.build(...));',
      );
    }

    final extra = extraRaw;

    final title =
        extra.safe<String>(SuccessScreenKeys.title) ?? Strings.msg_reset_password_done.tr();
    final subtitle =
        extra.safe<String>(SuccessScreenKeys.subtitle) ?? Strings.msg_reset_success.tr();
    final primaryButtonLabel =
        extra.safe<String>(SuccessScreenKeys.primaryButtonLabel) ?? Strings.btn_go_login.tr();
    final showSecondButton = extra.safe<bool>(SuccessScreenKeys.secondButton) ?? false;
    final secondButtonLabel =
        extra.safe<String>(SuccessScreenKeys.secondButtonLabel) ?? Strings.btn_go_login.tr();

    final onTapId = extra.safe<String>(SuccessScreenKeys.onTapId);
    final onPrimaryTap = onTapId != null
        ? CallbackRegistry.retrieve(onTapId)
        : () => context.goTo(AppRoutes.login);

    final onPrimaryRoute = extra.safe<String>(SuccessScreenKeys.onPrimaryRoute);

    final onSecondTapId = extra.safe<String>(SuccessScreenKeys.onSecondTapId);
    final onSecondaryTap = onSecondTapId != null ? CallbackRegistry.retrieve(onSecondTapId) : null;

    final transactionNumber = extra.safe<String>(SuccessScreenKeys.transactionNumber);
    final showShareButton = extra.safe<bool>(SuccessScreenKeys.shareButton) ?? false;
    final shareButtonLabel = extra.safe<String>(SuccessScreenKeys.shareButtonLabel);
    final shareTapId = extra.safe<String>(SuccessScreenKeys.onShareTapId);
    final onShareTap = shareTapId != null ? CallbackRegistry.retrieve(shareTapId) : null;

    return SuccessScreenArgs(
      title: title,
      subtitle: subtitle,
      primaryButtonLabel: primaryButtonLabel,
      showSecondaryButton: showSecondButton,
      secondaryButtonLabel: secondButtonLabel,
      onPrimaryTap: onPrimaryTap,
      onSecondaryTap: onSecondaryTap,
      onPrimaryRoute: onPrimaryRoute,
      transactionNumber: transactionNumber,
      showShareButton: showShareButton,
      shareButtonLabel: shareButtonLabel,
      onShareTap: onShareTap,
    );
  }
}
