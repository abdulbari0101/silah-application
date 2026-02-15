import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart'; // resolveInputFillColor
import 'package:silah_app/core/config/validators/form_validators.dart';

class FMobileField extends StatefulWidget {
  final TextEditingController mobileNoController;
  final String? errorText;
  final FocusNode? focusNode;
  final bool enabled;
  final List<String? Function(String?)>? validators;
  final String? hintText;
  final bool showLabel;
  final Widget? prefixIcon;

  const FMobileField({
    super.key,
    required this.mobileNoController,
    this.errorText,
    this.focusNode,
    this.enabled = true,
    this.validators,
    this.hintText,
    this.showLabel = true,
    this.prefixIcon,
  });

  @override
  State<FMobileField> createState() => _FMobileFieldState();
}

class _FMobileFieldState extends State<FMobileField> {
  late final FocusNode _node;
  late final bool _internalNode;
  late String? Function(String?) _validator;

  @override
  void initState() {
    super.initState();

    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
    _node.addListener(() => setState(() {}));

    _validator = validateCombine(widget.validators ?? []);
    // _validator = validateCombine(widget.validators ?? [validateMobileDefault]);
  }

  @override
  void dispose() {
    if (_internalNode) _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: widget.mobileNoController, // rebuild on every text change
      builder: (context, value, child) {
        final hasValue = value.text.isNotEmpty;
        final hasError = (widget.errorText?.isNotEmpty ?? false);
        final labelText = Strings.customer_number.tr();
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
            TextFormField(
              controller: widget.mobileNoController,
              focusNode: _node,
              enabled: widget.enabled,
              maxLength: 10,
              keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$'))],
              decoration: InputDecoration(
                labelText: showLabel ? null : labelText,
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                fillColor: fillColor,
              ),
              validator: _validator,
            ),
          ],
        );
      },
    );
  }
}
