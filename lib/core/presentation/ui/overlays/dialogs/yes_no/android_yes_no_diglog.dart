import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/responsive/dimensions.dart';

class AndroidYesNoDialog extends StatefulWidget {
  const AndroidYesNoDialog({
    super.key,
    required this.title,
    required this.body,
    this.onNoClick,
    this.onYesClick,
    this.titleWidget,
  });
  final String title;
  final String body;
  final Function()? onYesClick;
  final Function()? onNoClick;
  final Widget? titleWidget;

  @override
  State<AndroidYesNoDialog> createState() => _AndroidYesNoDialogState();
}

class _AndroidYesNoDialogState extends State<AndroidYesNoDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20,
      contentPadding: EdgeInsets.zero,
      shape: context.shapes.roundedXs,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: context.colors.blackOrWhite,
            ),
          ),
          widget.titleWidget ?? const SizedBox(),
        ],
      ),
      content: SizedBox(
        width: AppDimension(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, //
            children: [
              UIConstants.smallHeight,
              Text(
                widget.body,
                style: context.textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  color: context.colors.blackOrWhite.withAlphaOpacity(0.8),
                ),
              ),
              UIConstants.smallHeight,
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          borderRadius: context.shapes.brSm,
          onTap: widget.onNoClick,
          splashColor: context.colors.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.no.tr(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colors.primary,
                fontSize: 14,
              ),
            ),
          ),
        ),
        UIConstants.bigWidth,
        InkWell(
          borderRadius: context.shapes.brSm,
          onTap: widget.onYesClick,
          splashColor: context.colors.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.yes.tr(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colors.primary,
                fontSize: 14,
              ),
            ),
          ),
        ),
        UIConstants.smallWidth,
      ],
    );
  }
}
