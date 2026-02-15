import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/global_navigator.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/foundation/formatting/phone_utils.dart';
import 'package:silah_app/core/infrastructure/system/phone_launcher.dart';
import 'package:silah_app/core/presentation/ui/overlays/sheets/adaptive_bottom_sheet.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/secondary_button.dart';

class CallUsSheet {
  const CallUsSheet._();

  static Future<void> show(
    BuildContext context,
    String number, {
    IsoCode? isoHint,
    Offset? anchorPoint,
  }) async {
    final pretty = number.toPrettyPhone(country: isoHint, intl: true);

    await AdaptiveBottomSheet.show<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      anchorPoint: anchorPoint,
      builder: (_) => _MaterialBody(number: number, prettyNumber: pretty, context: context),
      cupertinoBuilder: (_) =>
          _CupertinoBody(number: number, prettyNumber: pretty, context: context),
    );
  }

  /* CallUsSheet  Cupertin​o */
  static Widget _CupertinoBody({
    required String number,
    required String prettyNumber,
    required BuildContext context,
  }) {
    final ct = CupertinoTheme.of(context);

    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => PhoneLauncher.call(number),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Icon(CupertinoIcons.phone_fill, color: ct.primaryColor),
              ),
              Expanded(
                child: Text(
                  prettyNumber,
                  overflow: TextOverflow.ellipsis,
                  style: ct.textTheme.actionTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.pop(rootNavigatorKey.currentState!.context),
        child: Text(Strings.cancel.tr(), style: ct.textTheme.actionTextStyle),
      ),
    );
  }

  /*Material CallUsSheet*/
  static Widget _MaterialBody({
    required String number,
    required String prettyNumber,
    required BuildContext context,
  }) {
    final ct = CupertinoTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => PhoneLauncher.call(number),
            borderRadius: context.shapes.brLg,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: context.shapes.brLg,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(0x20),
                    ),
                    child: Icon(CupertinoIcons.phone_fill, color: Colors.white, size: 20),
                  ),
                  Expanded(
                    child: Text(
                      prettyNumber,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: ct.textTheme.actionTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 34, height: 34),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // cancel
          SizedBox(
            width: double.infinity,
            child: SecondaryButton(
              onTap: () => Navigator.pop(rootNavigatorKey.currentState!.context),
              text: Strings.cancel.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
