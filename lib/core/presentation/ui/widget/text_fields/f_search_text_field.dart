// f_search_text_field.dart
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart'; // ⬅ resolver

class FSearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final FocusNode? focusNode;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function()? onCleared;
  final void Function(String)? onChanged;
  final bool showLabel;

  const FSearchTextField({
    super.key,
    required this.controller,
    this.errorText,
    this.focusNode,
    this.enabled = true,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
    this.onCleared,
    this.onChanged,
    this.showLabel = false,
  });

  @override
  State<FSearchTextField> createState() => _FSearchTextFieldState();
}

class _FSearchTextFieldState extends State<FSearchTextField> {
  late final FocusNode _node;
  late final bool _internalNode;

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
    _node.addListener(() => setState(() {}));
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    if (_internalNode) _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.controller.text.isNotEmpty;
    final hasError = (widget.errorText?.isNotEmpty ?? false);
    final labelText = widget.labelText;
    final showLabel = widget.showLabel && (labelText?.isNotEmpty ?? false);

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
        if (showLabel) buildInputLabel(context, labelText!),
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: _node,

          enabled: widget.enabled,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: hasValue
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onCleared?.call();
                    },
                  )
                : null,
            labelText: showLabel ? null : null,
            hintText: showLabel ? widget.hintText : (widget.hintText ?? widget.labelText),
            filled: true,
            fillColor: fillColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
