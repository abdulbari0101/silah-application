import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';

import 'adaptive_bottom_sheet.dart';

Future<T?> showOptionSelectionSheet<T>({
  required BuildContext context,
  required List<T> options,
  required T selected,
  required String title,
  required String Function(T, bool) labelResolver,
  Widget? Function(T option, bool selected)? trailingBuilder,
  String? Function(T option, bool selected)? subtitleResolver,
  Widget Function(BuildContext, T, bool)? itemBuilder,
}) {
  return AdaptiveBottomSheet.show(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => OptionSheet<T>(
      options: options,
      selected: selected,
      labelResolver: labelResolver,
      title: title,
      trailingBuilder: trailingBuilder,
      subtitleResolver: subtitleResolver,
      itemBuilder: itemBuilder,
    ),
  );
}

class OptionSheet<T> extends StatelessWidget {
  final List<T> options;
  final T? selected;
  final String Function(T, bool) labelResolver;
  final String title;
  final Widget? Function(T option, bool selected)? trailingBuilder;
  final String? Function(T option, bool selected)? subtitleResolver;
  final Widget Function(BuildContext, T, bool)? itemBuilder;

  const OptionSheet({
    super.key,
    required this.options,
    required this.selected,
    required this.labelResolver,
    required this.title,
    this.trailingBuilder,
    this.subtitleResolver,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildFilterList() {
      return Card(
        shape: context.shapes.roundedLg,
        margin: EdgeInsets.symmetric(horizontal: UIConstants.mediumPadding),
        child: ScreenPaddingWrapper(
          fullWidth: true,
          child: Column(
            children: options.map((e) {
              final isSelected = selected == e;

              if (itemBuilder != null) {
                return InkWell(
                  onTap: () => Navigator.of(context).pop(e),
                  child: itemBuilder!(context, e, isSelected),
                );
              }

              final trailing =
                  trailingBuilder?.call(e, isSelected) ??
                  (isSelected ? Icon(Icons.check) : null);
              final subtitle = subtitleResolver?.call(e, isSelected);

              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: UIConstants.screenHorizantalPadding,
                ),
                shape: context.shapes.roundedMd,
                splashColor: context.colors.primary,

                title: Text(
                  labelResolver(e, isSelected),
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle,
                        style: context.textTheme.labelSmall!.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      )
                    : null,
                trailing: trailing,
                onTap: () => Navigator.of(context).pop(e),
              );
            }).toList(),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          UIConstants.smallHeight,
          Center(
            child: Container(
              width: 36,
              height: 5,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: context.colors.outlineVariant,
                borderRadius: context.shapes.brXl,
              ),
            ),
          ),
          Text(
            title,
            style: context.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.w700)
                .copyWith(color: context.colors.onSurface),
          ),
          UIConstants.bigHeight,
          buildFilterList(),
          UIConstants.bigHeight,
        ],
      ),
    );
  }
}
