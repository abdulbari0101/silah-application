import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/components/inputs.dart';

class FDateField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? errorText;
  final FocusNode? focusNode;
  final bool enabled;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime)? onDateSelected;
  final String? hintText;
  final bool showLabel;

  const FDateField({
    super.key,
    required this.controller,
    this.labelText,
    this.errorText,
    this.focusNode,
    this.enabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.hintText,
    this.showLabel = true,
  });

  @override
  State<FDateField> createState() => _FDateFieldState();
}

class _FDateFieldState extends State<FDateField> {
  late final FocusNode _node;
  late final bool _internalNode;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
  }

  @override
  void dispose() {
    if (_internalNode) _node.dispose();
    super.dispose();
  }

  Future<void> _pickDate(BuildContext context) async {
    if (!widget.enabled) return;

    final now = DateTime.now();
    final initialDate = widget.initialDate ?? now;
    final firstDate = widget.firstDate ?? DateTime(1900);
    final lastDate = widget.lastDate ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,

      locale: const Locale('en'),
    );

    if (picked != null) {
      final formatted = DateFormat('yyyy/MM/dd', 'en').format(picked);

      widget.controller.text = formatted;

      widget.onDateSelected?.call(picked);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.controller.text.isNotEmpty;
    final hasError = (widget.errorText?.isNotEmpty ?? false);
    final labelText = widget.labelText ?? 'Select date';
    final showLabel = widget.showLabel && labelText.isNotEmpty;

    final fillColor = resolveInputFillColor(
      context,
      enabled: widget.enabled,
      isFocused: _node.hasFocus,
      hasValue: hasValue,
      hasError: hasError,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) buildInputLabel(context, labelText),
        GestureDetector(
          onTap: () => _pickDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: widget.controller,
              focusNode: _node,
              enabled: widget.enabled,
              readOnly: true,
              decoration: InputDecoration(
                labelText: showLabel ? null : labelText,
                hintText: widget.hintText,
                suffixIcon: const Icon(Icons.calendar_today),
                filled: true,
                fillColor: fillColor,
                errorText: widget.errorText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
