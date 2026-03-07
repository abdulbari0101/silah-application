import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:silah_app/core/config/extentions/string_validation.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/theme_setting/android_theme_setting_diglog.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/theme_setting/ios_theme_setting_diglog.dart';
import 'package:silah_app/core/presentation/ui/overlays/dialogs/yes_no/ios_yes_no_diglog.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';
import 'package:silah_app/core/presentation/ui/responsive/responsive.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/primary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/core/presentation/ui/widget/text/expendable_text_widget.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../config/constants/ui_constants.dart';
import '../../../../config/localization/localizations_string_keys.dart';
import '../../../../config/router/global_navigator.dart';
import '../../../../infrastructure/platform/app_platform.dart';

enum DialogMessageType { info, warning, success, error, confirm }

class DialogService {
  static void showBaseDialog(
    BuildContext context, {
    String? title,
    String? message,
    String? confirmButtonLabel,
    String? cancelButtonLabel,
    Function()? onConfirmsClick,
    Function()? onCancelClick,
    Widget? body,
    String? iconAsset,
  })
  {
    Widget buildBody() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          message != null ? Text(message, style: context.textTheme.bodySmall) : body ?? Text(''),
          if (message != null || body != null) UIConstants.xbigHeight,
        ],
      );
    }

    showDialog(
      // barrierColor: context.brand.primaryDark.withAlphaOpacity(0.8),
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          alignment: Alignment(0.0, 0.9),
          contentPadding: const EdgeInsets.all(UIConstants.mediumPadding),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(UIConstants.defaultPadding12),
                decoration: BoxDecoration(color: context.colors.lightBlue4, shape: BoxShape.circle),
                child: iconAsset != null
                    ? AppSvgIcon(assetName: iconAsset)
                    : Icon(Icons.info_outline_rounded, size: 32),
              ),
              UIConstants.bigHeight,
              Text(
                title ?? Strings.confirm_operation.tr(),

                style: Theme.of(context).dialogTheme.titleTextStyle,
              ),
              UIConstants.mediumHeight,
              buildBody(),
              if (onConfirmsClick != null)
                PrimaryButton(
                  // backgroundRadius: 25,
                  onTap: () {
                    onConfirmsClick() ?? Navigator.of(dialogContext, rootNavigator: true).pop();
                  },
                  text: confirmButtonLabel ?? Strings.btn_confirm.tr(),
                ),
              UIConstants.mediumHeight,
              SecondaryButton(
                backgroundRadius: 25,
                onTap: () {
                  if (onCancelClick != null) {
                    onCancelClick();
                  }
                  Navigator.of(dialogContext, rootNavigator: true).pop();
                  
                },
                text: cancelButtonLabel ?? Strings.cancel.tr(),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showYesNoDialog(
    BuildContext context, {
    required String title,
    String? yesTitle,
    String? noTitle,
    String? desc,
    String? body,
    Function()? onYesClick,
    Function()? onNoClick,
    Widget? titleWidget,
  })
  {
    if (AppPlatform.isIOS) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return IOSYesNoDialog(
            title: title,
            body: body,
            yesTitle: yesTitle,
            noTitle: noTitle,
            onYesClick: onYesClick,
            onNoClick: onNoClick,
            desc: desc,
            titleWidget: titleWidget,
          );
        },
      );
    } else {
      DialogService.showYNDialog(
        context,
        title: title,
        yesTitle: yesTitle,
        noTitle: noTitle,
        content: body,
        desc: desc,
        onOKPressed: onYesClick,
        onCancelPressed: onNoClick,
        titleWidget: titleWidget,
      );
    }
  }

  static showYNDialog(
    BuildContext context, {
    required String title,
    String? content,
    Function()? onOKPressed,
    String? desc,
    Function()? onCancelPressed,
    Widget? titleWidget,
    String? yesTitle,
    String? noTitle,
  })
  {
    bool hasBody = content.isNotNullOrEmpty;
    return AwesomeDialog(
      // barrierColor: context.brand.primaryDark.withAlphaOpacity(0.8),
      context: context,
      isDense: true,
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      alignment: AlignmentDirectional.bottomCenter,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasBody)
            Center(
              child: Text(
                content ?? '',
                style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          if (hasBody) UIConstants.xbigHeight,

          if (!hasBody) ...[
            Text(
              title,
              style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
            UIConstants.mediumHeight,
            ExpandableTextWidget(
              text: desc ?? "",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium,
              trimLines: 2,
            ),
            UIConstants.xbigHeight,
          ],

          PrimaryButton(
            // backgroundRadius: 25,
            onTap: () {
              Navigator.pop(context);
              onOKPressed?.call();
            },
            text: yesTitle ?? Strings.yes.tr(),
          ),
          UIConstants.mediumHeight,
          SecondaryButton(
            backgroundRadius: 25,
            onTap: () {
              Navigator.pop(context);
              onCancelPressed?.call();
            },
            text: noTitle ?? Strings.no.tr(),
          ),
        ],
      ),
      animType: AnimType.bottomSlide,
      dialogType: DialogType.question,
      customHeader: titleWidget,
      width: Responsive.isDesktop(context) ? 100 : null,
    ).show();
  }

  static bool _isSessionDialogOpen = false;

  static void showSessionExpiredDialog({
    required VoidCallback onOk,
  })
  {
    if (_isSessionDialogOpen) return;

    _isSessionDialogOpen = true;

    final context = rootNavigatorKey.currentContext!;
    final description =Strings.err_session_end_login.tr();

    final buttonTitle =Strings.login.tr();

    AwesomeDialog(
      // barrierColor: context.brand.primaryDark.withAlphaOpacity(0.8),
      context: context,
      alignment: AlignmentDirectional.bottomCenter,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      dismissOnTouchOutside: false,
      customHeader: LottieBuilder.asset(Assets.lottie.logout, decoder: LottieComposition.decodeZip),
      dismissOnBackKeyPress: false,
      title: Strings.err_session_end.tr(),
      desc: description,
      btnOkText: buttonTitle,
      btnOkOnPress: () {
        onOk();
      },
    ).show();
    _isSessionDialogOpen = false;
  }


  static showErrorDialog(
    BuildContext context,
      {
    Function()? onOKPressed,
    Function()? onCancelPressed,
    String? content,
    String? okBtnTitle,
    String? cancelBtnTitle,
    String? title,
    String? desc,
  })
  {
    final text = context.textTheme;

    final hasBody = content != null && content.trim().isNotEmpty;

    return AwesomeDialog(
      context: context,
      dialogBorderRadius: context.shapes.brMd,
      animType: AnimType.scale,
      dialogType: DialogType.error, // conveys error visually
      isDense: true,
      headerAnimationLoop: false,
      padding: const EdgeInsets.all(UIConstants.mediumPadding),
      alignment: AlignmentDirectional.bottomCenter,
      width: Responsive.isDesktop(context) ? 100 : AppDimension(context).width,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasBody)
            Center(
              child: Text(
                content,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          if (hasBody) UIConstants.bigHeight,

          if (!hasBody) ...[
            Text(
              title ?? "",
              style: text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            UIConstants.mediumHeight,
            // Use neutral body for long text; let the dialog’s visuals indicate error.
            ExpandableTextWidget(
              text: desc ?? "",
              textAlign: TextAlign.center,
              style: text.bodyMedium?.copyWith(color: context.colors.onSurfaceVariant),
              trimLines: 2,
            ),
            UIConstants.xbigHeight,
          ],

          PrimaryButton(
            onTap: () {
              Navigator.pop(context);
              onOKPressed?.call();
            },
            text: okBtnTitle ?? Strings.try_again.tr(),
          ),
          UIConstants.mediumHeight,
          SecondaryButton(
            backgroundRadius: 25,
            onTap: () {
              Navigator.pop(context);

              onCancelPressed?.call();
            },
            text: cancelBtnTitle ?? Strings.cancel.tr(),
          ),
        ],
      ),
    ).show();
  }

  static void showThemeSetting(BuildContext context)
  {
    if (AppPlatform.isIOS) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const IOSThemeSettingDialog();
        },
      );
    } else {
      showDialog(
        useSafeArea: false,
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return const AndroidThemeSettingDialog();
        },
      );
    }
  }


  static showWarningDialog(
    BuildContext context, {

    Function()? onOKPressed,
    Function()? onCancelPressed,

    String? content,
    String? okBtnTitle,
    String? cancelBtnTitle,
    String? title,
    String? desc,
  })
  {
    showBaseDialog(
      context,
      title: title,
      message: desc,
      confirmButtonLabel: okBtnTitle,
      body: content.isNotNullOrEmpty
          ? Center(
              child: Text(
                content ?? "",
                textAlign: TextAlign.center,
                style: context.textTheme.labelLarge!.copyWith(),
              ),
            )
          : null,
      cancelButtonLabel: cancelBtnTitle,
      onCancelClick: onCancelPressed,
      onConfirmsClick: onOKPressed,
    );
  }


  static showSucessDialog(
      BuildContext context, {
        bool dismissible = true,

        Function()? onOKPressed,
        Function()? btnCancelOnPress,

        String? content,
        String? okBtnTitle,
        String? cancelBtnTitle,
        String? title,
        String? desc,
      })
  {
    return AwesomeDialog(
      context: context,
      barrierColor: context.colors.primary.withValues(alpha: 0.8),
      animType: AnimType.scale,
      isDense: true,
      dismissOnTouchOutside: dismissible,
      dismissOnBackKeyPress: dismissible,
      dialogType: DialogType.success,
      alignment: AlignmentDirectional.bottomCenter,
      width:  null,
      body:
      content.isNotNullOrEmpty
          ? Center(
        child: Text(
          content ?? "",
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      )
          : null,

      title: title,
      btnOkText: okBtnTitle ?? Strings.btn_next.tr(),
      desc: desc,
      btnCancelText: cancelBtnTitle,
      btnCancelOnPress:btnCancelOnPress ,
      btnOkOnPress: onOKPressed,
    ).show();
  }
}
