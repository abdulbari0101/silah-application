import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/theme/components/inputs.dart';
import 'package:silah_app/core/config/validators/form_validators.dart';
import 'package:silah_app/core/presentation/ui/widget/icons/app_svg_icon.dart';
import 'package:silah_app/gen/assets.gen.dart';

class FPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final bool enabled;
  final String? errorText;
  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool showLabel;
  final Widget? prefixIcon;
  final Widget? prefixOutSideWidget;
  final TextInputType? keyboardType;

  const FPasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.enabled = true,
    this.errorText,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.hintText,
    this.showLabel = true,
    this.prefixIcon,
    this.keyboardType,
    this.prefixOutSideWidget,
  });

  @override
  State<FPasswordField> createState() => _FPasswordFieldState();
}

class _FPasswordFieldState extends State<FPasswordField> {
  bool _obscure = true;
  late final TextEditingController _ctrl;
  TextEditingController? _externalCtrl;

  late final FocusNode _node;
  late final bool _internalNode;

  late String? Function(String?) _validator;

  void _toggleVisibility() => setState(() => _obscure = !_obscure);

  @override
  void initState() {
    super.initState();
    _externalCtrl = widget.controller;
    _ctrl = _externalCtrl ?? TextEditingController();

    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
    _node.addListener(() => setState(() {})); // react to focus

    _validator =
        widget.validator ??
        (value) => validateCurrentPassword(
          currentPassword: value,
          label: widget.label,
        );
  }

  @override
  void dispose() {
    if (_externalCtrl == null) _ctrl.dispose();
    if (_internalNode) _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _ctrl, // rebuild when text changes
      builder: (context, value, _) {
        final labelText = widget.label ?? Strings.password.tr();
        final showLabel = widget.showLabel && labelText.isNotEmpty;
        final fillColor = resolveInputFillColor(
          context,
          enabled: widget.enabled,
          isFocused: _node.hasFocus,
          hasValue: value.text.isNotEmpty,
          // hasError: (FormField.maybeOf<String>(context)?.hasError ?? false), // optional
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showLabel) buildInputLabel(context, labelText),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _ctrl,
                    focusNode: _node,
                    obscureText: _obscure,
                    obscuringCharacter: '●',
                    enabled: widget.enabled,
                    keyboardType: widget.keyboardType,
                    enableSuggestions: false,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.password],
                    //  keyboardType: TextInputType.number, // use TextInputType.text if not strictly numeric
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    onFieldSubmitted: widget.onSubmitted,
                    validator: _validator,
                    decoration: InputDecoration(
                      labelText: showLabel ? null : labelText,
                      hintText: widget.hintText,
                      counterText: '',
                      fillColor: fillColor,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: IconButton(
                        tooltip: _obscure ? 'Show password' : 'Hide password',
                        icon: AppSvgIcon(
                          assetName: _obscure
                              ? Assets.icons.eyeClosed
                              : Assets.icons.eyeOpen,
                        ),
                        onPressed: _toggleVisibility,
                      ),
                    ),
                  ),
                ),
                if (widget.prefixOutSideWidget != null)
                  Row(
                    children: [
                      UIConstants.smallWidth,
                      widget.prefixOutSideWidget!,
                    ],
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
