// f_email_field.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart'; // ⬅ resolver

class FEmailField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final FocusNode? focusNode;
  final bool enabled;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final bool showLabel;

  const FEmailField({
    super.key,
    required this.controller,
    this.errorText,
    this.focusNode,
    this.enabled = true,
    this.decoration,
    this.validator,
    this.labelText,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.showLabel = true,
  });

  @override
  State<FEmailField> createState() => _FEmailFieldState();
}

class _FEmailFieldState extends State<FEmailField> {
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
    final labelText = widget.labelText ?? Strings.email_address.tr();
    final showLabel =
        widget.showLabel && (widget.decoration == null) && labelText.isNotEmpty;

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
        TextFormField(
          controller: widget.controller,
          focusNode: _node,
          enabled: widget.enabled,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: widget.textInputAction,
          inputFormatters: [FilteringTextInputFormatter.deny(RegExp('[٠-٩]'))],
          decoration:
              (widget.decoration ??
              InputDecoration(
                labelText: showLabel ? null : labelText,
                hintText: widget.hintText,
                filled: true,
                fillColor: fillColor,
              )),
          validator: widget.validator,
        ),
      ],
    );
  }
}
