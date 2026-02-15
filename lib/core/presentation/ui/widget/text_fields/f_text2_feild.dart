import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart'; // ⬅ resolver

class FTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final FocusNode? focusNode;
  final bool enabled;
  final int? maxLength;
  final TextInputAction textInputAction;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool showLabel;

  const FTextField({
    super.key,
    required this.controller,
    this.errorText,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
    this.obscureText = false,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.showLabel = true,
  });

  @override
  State<FTextField> createState() => _FTextFieldState();
}

class _FTextFieldState extends State<FTextField> {
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
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            labelText: showLabel ? null : widget.labelText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            filled: true,
            fillColor: fillColor,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
