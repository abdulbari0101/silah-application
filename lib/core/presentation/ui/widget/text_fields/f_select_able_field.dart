import 'package:flutter/material.dart';

import '../../../../config/theme/components/inputs.dart';
import '../../../../config/theme/extentions/theme_context_extension.dart';
import '../../overlays/sheets/adaptive_bottom_sheet.dart';
import '../../overlays/sheets/option_sheet.dart';
class FSelectableField<T> extends StatefulWidget {
  final T? initialValue;
  final List<T>? options;
  final Function(T) onChanged;
  final String? sheetTitle;
  final String Function(T)? labelResolver;
  final String? labelText;
  final String? Function(T?)? validator;
  final Future<T?> Function(
      BuildContext context,
      T? selected,
      List<T> options,
      ) showOptionsSheet;

  const FSelectableField({
    super.key,
    required this.onChanged,
    required this.showOptionsSheet,
    this.options,
    this.initialValue,
    this.labelResolver,
    this.sheetTitle,
    this.labelText,
    this.validator,
  });

  @override
  State<FSelectableField<T>> createState() => _FSelectableFieldState<T>();
}

class _FSelectableFieldState<T> extends State<FSelectableField<T>>
    with WidgetsBindingObserver {
  T? _selectedValue;
  bool _isFocused = false;

  List<T> get _options => widget.options ?? [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _selectedValue = widget.initialValue;
  }

  @override
  void didUpdateWidget(covariant FSelectableField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() => _selectedValue = widget.initialValue);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = _selectedValue != null;
    final hasOptions = _options.isNotEmpty;
    final labelText = widget.labelText;
    final showLabel = labelText != null && labelText.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) buildInputLabel(context, labelText),
        FocusScope(
          child: Focus(
            onFocusChange: (hasFocus) {
              if (mounted) setState(() => _isFocused = hasFocus);
            },
            child: FormField<T>(
              initialValue: widget.initialValue,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: widget.validator,
              builder: (fieldState) {
                final bool hasError = fieldState.hasError;

                final fillColor = resolveInputFillColor(
                  context,
                  enabled: hasOptions,
                  isFocused: _isFocused,
                  hasValue: hasValue,
                  hasError: hasError,
                );
                final scheme = context.colors;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (!hasOptions) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("لا توجد خيارات متاحة حاليًا"),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          return;
                        }

                        final selected = await widget.showOptionsSheet(
                          context,
                          _selectedValue,
                          _options,
                        );

                        if (selected != null) {
                          setState(() => _selectedValue = selected);
                          fieldState.didChange(selected);
                          widget.onChanged(selected);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: fillColor,
                          borderRadius: context.shapes.brMd,
                          border: Border.all(
                            color: hasError
                                ? scheme.error
                                : (_isFocused ? scheme.primary : scheme.outline),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: TextEditingController(
                                  text: hasValue
                                      ? (widget.labelResolver?.call(_selectedValue as T) ??
                                      "$_selectedValue")
                                      : "",
                                ),
                                readOnly: true,
                                onTap: () async {
                                  if (!hasOptions) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("لا توجد خيارات متاحة للاختيار"),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                    return;
                                  }

                                  final selected = await widget.showOptionsSheet(
                                    context,
                                    _selectedValue,
                                    _options,
                                  );

                                  if (selected != null) {
                                    setState(() => _selectedValue = selected);
                                    fieldState.didChange(selected);
                                    widget.onChanged(selected);
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: showLabel ? null : widget.labelText,
                                  fillColor: fillColor,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            Icon(
                              hasOptions
                                  ? Icons.keyboard_arrow_down_rounded
                                  : Icons.block,
                              color: hasOptions
                                  ? scheme.onSurfaceVariant
                                  : scheme.onSurfaceVariant.withAlphaOpacity(0.5),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0, left: 4.0),
                        child: Text(
                          fieldState.errorText!,
                          style: context.inputTheme.errorStyle,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}



Future<T?> showGenericOptionSheet<T>({
  required BuildContext context,
  required T? selected,
  required List<T> options,
  required String Function(T) labelResolver,
  String? sheetTitle,
}) {
  return AdaptiveBottomSheet.show<T>(
    context: context,
    isScrollControlled: true,

    builder: (ctx) => OptionSheet<T>(
      options: options,
      selected: selected,
      title: sheetTitle ?? "",
      labelResolver: (option, isSelected) => labelResolver(option),
      // subtitleResolver: (option, isSelected) => option.displaySubtitle,
      trailingBuilder: (option, isSelected) => isSelected ? const Icon(Icons.check) : null,
    ),
  );
}
