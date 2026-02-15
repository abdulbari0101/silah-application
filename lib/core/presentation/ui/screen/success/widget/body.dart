import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/extentions/map_extras_extension.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/route_extensions.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/infrastructure/system/copy_util.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/screen/success/helper/success_screen_keys.dart';
import 'package:silah_app/core/presentation/ui/screen/success/widget/success_background.dart';
import 'package:silah_app/core/presentation/ui/screen/success/widget/success_title_text.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_no_bg_button.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';
import 'package:silah_app/gen/assets.gen.dart';

import '../../../../../config/router/app_routes.dart';
import '../helper/callback_registry.dart';
import 'shared_button.dart';
import 'success_subtitle_text.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [SuccessBackground(), _Content()]);
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  bool _postFrameHandled = false;

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>? ?? {};

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
    final onPrimaryRoute = extra.safe<String>(SuccessScreenKeys.onPrimaryRoute);

    final onPrimaryTap = onTapId != null
        ? CallbackRegistry.retrieve(onTapId)
        : () => context.goTo(AppRoutes.login);

    final onSecondTapId = extra.safe<String>(SuccessScreenKeys.onSecondTapId);
    final onSecondaryTap = onSecondTapId != null ? CallbackRegistry.retrieve(onSecondTapId) : null;
    final transactionNumber = extra.safe<String>(SuccessScreenKeys.transactionNumber);
    final showShareButton = extra.safe<bool>(SuccessScreenKeys.shareButton) ?? false;
    final shareButtonLabel = extra.safe<String>(SuccessScreenKeys.shareButtonLabel);
    final shareTapId = extra.safe<String>(SuccessScreenKeys.onShareTapId);
    final onShareTap = shareTapId != null ? CallbackRegistry.retrieve(shareTapId) : null;
    final postFrameTapId = extra.safe<String>(SuccessScreenKeys.onPostFrameTapId);

    if (!_postFrameHandled && postFrameTapId != null) {
      _postFrameHandled = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        CallbackRegistry.invoke(postFrameTapId);
      });
    }

    final spacing = AppDimension(context).height * 0.03;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          if (onPrimaryTap != null) {
            onPrimaryTap();
          } else if (onSecondaryTap != null) {
            onSecondaryTap();
          } else {
            if (onPrimaryRoute != null) {
              context.goTo(AppRoutes.home);
            } else {
              if (Navigator.canPop(context)) Navigator.pop(context);
            }
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Spacer(flex: 2),
            // SuccessCheckMarkIcon(colorIcon: context.colors.primary),
            ScreenPaddingWrapper(child: SuccessTitleText(title: title)),
            SizedBox(height: spacing),

            AppSvgIcon(
              assetName: Assets.icons.doneSuccess,
              matchTextDirection: false,
              darkDynamicColor: false,
            ),
            SizedBox(height: spacing),
            ScreenPaddingWrapper(child: SuccessSubtitleText(subtitle: subtitle)),
            if (transactionNumber != null) ...[
              SizedBox(height: spacing * 0.6),
              _TransactionNumberCard(transactionNumber: transactionNumber),
            ],

            //    SuccessContentText(title: title, subtitle: subtitle),
            SizedBox(height: spacing),
            const Spacer(flex: 3),
            Column(
              children: [
                if (showShareButton) ShareButton(onShareTap: onShareTap),

                PrimaryButton(
                  text: primaryButtonLabel,
                  onTap: () {
                    if (onPrimaryRoute != null) {
                      context.goNamed(AppRoutes.home.name);
                    } else {
                      onPrimaryTap?.call();
                    }
                  },
                ),
                SizedBox(height: spacing),
                if (showSecondButton)
                  Column(
                    children: [
                      SecondaryNoBgButton(
                        text: secondButtonLabel,
                        onTap: onSecondaryTap,
                        textColor: context.colors.lightBlue3,
                      ),
                      SizedBox(height: spacing),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionNumberCard extends StatelessWidget {
  final String transactionNumber;

  const _TransactionNumberCard({required this.transactionNumber});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = colors.isDark;

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark
          ? [
              colors.surfaceContainerHighest.mix(colors.surface, 0.2) ??
                  colors.surfaceContainerHighest,
              colors.surface.mix(colors.primary, 0.08) ?? colors.surface,
            ]
          : [colors.primary.withValues(alpha: 0.08), colors.surface],
    );

    final borderColor = colors.outlineVariant.withAlphaOpacity(isDark ? 0.2 : 0.3);
    final copyAction = () => CopyUtil.copyValue(transactionNumber, context);

    return Semantics(
      button: true,
      label: Strings.transaction_no.tr(),
      hint: Strings.btn_copy.tr(),
      value: transactionNumber,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: copyAction,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor),
              boxShadow: isDark ? [] : context.shadowSoft,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: isDark ? 0.18 : 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppSvgIcon(
                    assetName: Assets.icons.copy,
                    width: 18,
                    height: 18,
                    matchTextDirection: false,
                    darkDynamicColor: true,
                    lightDynamicColor: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.transaction_no.tr(),
                        style: context.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        transactionNumber,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                          color: colors.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _CopyButton(onCopy: copyAction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyButton extends StatelessWidget {
  final VoidCallback onCopy;

  const _CopyButton({required this.onCopy});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = colors.isDark;

    return SizedBox(
      height: 38,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          backgroundColor: colors.primary.withValues(alpha: isDark ? 0.16 : 0.12),
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          overlayColor: colors.primary.withValues(alpha: 0.12),
        ),
        onPressed: onCopy,
        icon: const Icon(Icons.copy_rounded, size: 18),
        label: Text(
          Strings.btn_copy.tr(),
          style: context.textTheme.labelLarge?.copyWith(
            color: colors.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
