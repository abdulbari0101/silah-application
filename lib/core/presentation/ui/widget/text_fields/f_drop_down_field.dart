// f_dropdown_field.dart
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart'; // ⬅ resolver

class FDropdownField extends StatefulWidget {
  final String label;
  final FocusNode? focusNode;
  final List<String> options;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool showLabel;

  const FDropdownField({
    super.key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.validator,
    this.focusNode,
    this.hintText,
    this.showLabel = true,
  });

  @override
  State<FDropdownField> createState() => _FDropdownField();
}

class _FDropdownField extends State<FDropdownField> {
  late final FocusNode _node;
  late final bool _internalNode;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
    _node.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    if (_internalNode) _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = (widget.selectedValue?.isNotEmpty ?? false);
    final showLabel = widget.showLabel && widget.label.isNotEmpty;
    final fillColor = resolveInputFillColor(
      context,
      enabled: true, // add an 'enabled' param later if needed
      isFocused: _node.hasFocus,
      hasValue: hasValue,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) buildInputLabel(context, widget.label),
        DropdownButtonFormField<String>(
          initialValue: widget.selectedValue,
          focusNode: _node,
          onChanged: (value) {
            widget.onChanged(value);
            setState(() {});
          },
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: showLabel ? null : widget.label,
            hintText: widget.hintText,
            filled: true,
            fillColor: fillColor,
            // label & hint styles come from InputDecorationTheme
          ),
          items: widget.options.map((value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ],
    );
  }
}
