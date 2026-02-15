import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart';
import 'package:silah_app/core/config/theme/extentions/text_styling_extantion.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class FDropDown<T> extends StatefulWidget {
  final List<T> items;
  final T? initialValue;
  final String Function(T) labelBuilder;

  /// Optional subtitle builder (e.g. address under the name).
  /// If it returns empty/whitespace, the subtitle line is hidden.
  final String Function(T)? subTitleBuilder;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final String? hintText;

  final FormFieldValidator<T>? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<T?>? onSaved;

  const FDropDown({
    super.key,
    required this.items,
    this.initialValue,
    required this.labelBuilder,
    this.subTitleBuilder, // 🔹 make it optional for backward compatibility
    this.label,
    this.onChanged,
    this.hintText,
    this.validator,
    this.autovalidateMode,
    this.onSaved,
  });

  @override
  State createState() => _FDropDownState<T>();
}

class _FDropDownState<T> extends State<FDropDown<T>> {
  T? _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant FDropDown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _current = widget.initialValue;
    }

    final itemsChanged =
        !identical(widget.items, oldWidget.items) || widget.items.length != oldWidget.items.length;

    if (itemsChanged) {
      if (_current != null && !widget.items.contains(_current)) {
        _current = null;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onChanged?.call(null);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: _current,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      onSaved: widget.onSaved,
      builder: (field) {
        final theme = context.textTheme;
        final colors = context.colors;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) buildInputLabel(context, widget.label!),

            DropdownButtonHideUnderline(
              child: DropdownButton2<T>(
                isExpanded: true,
                hint: Text(widget.hintText ?? "choose", style: theme.bodySmall?.regular),
                items: widget.items.map((item) {
                  final title = widget.labelBuilder(item);
                  final subtitle = widget.subTitleBuilder?.call(item);
                  final hasSubtitle = subtitle != null && subtitle.trim().isNotEmpty;

                  return DropdownMenuItem<T>(
                    value: item,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: theme.bodySmall?.bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (hasSubtitle) ...[
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: theme.bodySmall?.regular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  );
                }).toList(),

                // 🔹 Use our tracked value to avoid the assertion crash
                value: _current,

                onChanged: (value) {
                  setState(() => _current = value);
                  field.didChange(value);
                  widget.onChanged?.call(value);
                },
                buttonStyleData: ButtonStyleData(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: context.shapes.brMd,
                    border: Border.all(color: field.hasError ? colors.error : colors.outline),
                    color: field.value != null
                        ? colors.surfaceContainerLowest
                        : colors.surfaceContainerLowest,
                  ),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  iconSize: 20,
                  iconEnabledColor: colors.onSurfaceVariant,
                  iconDisabledColor: colors.onSurfaceVariant.withAlphaOpacity(0.5),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 400,
                  decoration: BoxDecoration(
                    borderRadius: context.shapes.brMd,
                    color: colors.onPrimary,
                  ),
                  offset: const Offset(0, -8),
                  elevation: 8,
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(6),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                ),
              ),
            ),

            if (field.hasError) ...[
              const SizedBox(height: 6),
              Text(field.errorText!, style: context.inputTheme.errorStyle),
            ],
          ],
        );
      },
    );
  }
}
