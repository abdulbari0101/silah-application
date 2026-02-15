import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/buttons/card_button.dart';
import 'package:silah_app/core/presentation/ui/widget/wrappers/screen_padding_wrapper.dart';

import 'adaptive_bottom_sheet.dart';

class SheetButton<T> extends StatefulWidget {
  final String label;
  final T? selectedValue;
  final List<T> options;
  final String Function(T?, bool) labelResolver; // Updated to access selection state
  final String Function(T, bool)? sheetLabelResolver;
  final Widget? icon;
  final ValueChanged<T> onSelected;
  final String? title;

  /// Enables or disables the SheetButton
  final bool enabled;

  /// Custom widget to render trailing content per item
  final Widget? Function(T option, bool selected)? trailingBuilder;

  /// Optional subtitle text resolver per item
  final String? Function(T option, bool selected)? subtitleResolver;

  /// Custom builder for the full item; if provided, overrides trailingBuilder and subtitleResolver
  /// If provided, trailingBuilder and subtitleResolver will be ignored
  final Widget Function(BuildContext, T, bool)? itemBuilder;

  const SheetButton({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.labelResolver,
    this.sheetLabelResolver,
    required this.onSelected,
    this.icon,
    this.title,
    this.trailingBuilder,
    this.subtitleResolver,
    this.itemBuilder,
    this.enabled = true,
    this.showLabel = true,
  }) : assert(
         itemBuilder == null || (subtitleResolver == null && trailingBuilder == null),
         'If itemBuilder is provided, subtitleResolver and trailingBuilder will be ignored.',
       );

  /// Show the label above the field instead of inside the card.
  final bool showLabel;

  @override
  State<SheetButton<T>> createState() => _SheetButtonState<T>();
}

class _SheetButtonState<T> extends State<SheetButton<T>> {
  late T? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedValue;
  }

  @override
  void didUpdateWidget(covariant SheetButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedValue != oldWidget.selectedValue) {
      setState(() => _selected = widget.selectedValue);
    }
  }

  void _showSheet(BuildContext context) async {
    if (!widget.enabled) return;
    final result = await AdaptiveBottomSheet.show(
      context: context,
      isScrollControlled: true,

      builder: (ctx) => _SheetContent<T>(
        options: widget.options,
        selected: _selected,
        labelResolver: widget.sheetLabelResolver != null
            ? (item, selected) => widget.sheetLabelResolver!(item, selected)
            : (item, selected) => widget.labelResolver(item, selected),
        title: widget.title ?? widget.label,
        trailingBuilder: widget.trailingBuilder,
        subtitleResolver: widget.subtitleResolver,
        itemBuilder: widget.itemBuilder,
      ),
    );
    if (result != null) {
      setState(() => _selected = result);
      widget.onSelected(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    final labelStyle = text.labelMedium!.copyWith(color: cs.onSurfaceVariant); // Label-3
    final valueStyle = text.labelMedium!.copyWith(
      fontWeight: FontWeight.w500,
      color: cs.onSurfaceVariant,
    ); // Label-2 Semi

    final showLabel = widget.showLabel;
    final labelWidget = showLabel
        ? buildInputLabel(context, widget.label)
        : const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget,
        CardButton(
          onTap: widget.enabled ? () => _showSheet(context) : null,

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          borderRadius: context.shapes.brMd,
          borderColor: cs.outlineVariant,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: showLabel
                    ? Text(
                        widget.labelResolver(_selected, true),
                        style: valueStyle,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.label, style: labelStyle),
                          const SizedBox(height: 4),
                          Text(
                            widget.labelResolver(_selected, true),
                            style: valueStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
              ),
              widget.icon ?? const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _SheetContent<T> extends StatelessWidget {
  final List<T> options;
  final T? selected;
  final String Function(T, bool) labelResolver;
  final String title;
  final Widget? Function(T option, bool selected)? trailingBuilder;
  final String? Function(T option, bool selected)? subtitleResolver;
  final Widget Function(BuildContext, T, bool)? itemBuilder;

  const _SheetContent({
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
    final cs = context.colors;
    final text = Theme.of(context).textTheme;

    final titleStyle = Theme.of(context).appBarTheme.titleTextStyle; // H5
    final rowTitleBase = text.labelLarge!; // Label-2
    final rowSubtitle = text.labelMedium!.copyWith(color: cs.onSurfaceVariant); // Label-3

    Widget buildFilterList() {
      return Card(
        shape: context.shapes.roundedMd,

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
                  trailingBuilder?.call(e, isSelected) ?? (isSelected ? Icon(Icons.check) : null);
              final subtitle = subtitleResolver?.call(e, isSelected);

              return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: UIConstants.screenHorizantalPadding,
                ),
                shape: context.shapes.roundedMd,

                title: Text(
                  labelResolver(e, isSelected),
                  //   style: context.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                ),
                subtitle: subtitle != null ? Text(subtitle) : null,
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
                color: cs.onSurfaceVariant,
                borderRadius: context.shapes.brXs,
              ),
            ),
          ),

          //          Text(title, style: context.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700).copyWith(color: context.colors.onSurface)),
          Text(title, style: titleStyle, textAlign: TextAlign.center),
          UIConstants.bigHeight,
          buildFilterList(),
          UIConstants.bigHeight,
        ],
      ),
    );
  }
}
