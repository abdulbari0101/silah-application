import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class IOSYesNoDialog extends StatefulWidget {
  const IOSYesNoDialog({
    super.key,
    required this.title,
    this.body,
    this.onNoClick,
    this.onYesClick,
    this.titleWidget,
    this.yesTitle,
    this.noTitle,
    this.desc,
  });
  final String title;
  final String? body;
  final String? desc;
  final Function()? onYesClick;
  final Function()? onNoClick;
  final Widget? titleWidget;

  final String? yesTitle;
  final String? noTitle;

  @override
  State<IOSYesNoDialog> createState() => _IOSYesNoDialogState();
}

class _IOSYesNoDialogState extends State<IOSYesNoDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.titleWidget != null)
            SizedBox(height: 80, width: 100, child: widget.titleWidget),
          Text(
            widget.title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: context.colors.blackOrWhite.withAlphaOpacity(0.9),
            ),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.body ?? widget.desc ?? '',
              style: context.textTheme.bodySmall!.copyWith(
                fontSize: 14,
                color: context.colors.blackOrWhite.withAlphaOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: widget.onNoClick == null
              ? null
              : () {
                  widget.onNoClick!();
                  Navigator.of(context, rootNavigator: true).pop();
                },
          child: Text(
            Strings.no.tr(),
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.primary,
              fontSize: 14,
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: widget.onYesClick == null
              ? null
              : () {
                  widget.onYesClick!();

                  Navigator.of(context).pop();
                },
          child: Text(
            Strings.yes.tr(),
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.primary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
