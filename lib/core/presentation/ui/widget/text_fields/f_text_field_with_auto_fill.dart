import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../config/theme/components/inputs.dart';

class FTextFieldWithAutoFill extends StatefulWidget {
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
  final List<String> suggestions;
  final List<TextInputFormatter>? inputFormatters;
  final bool showLabel;
  const FTextFieldWithAutoFill({
    super.key,
    required this.controller,
    required this.suggestions,
    this.errorText,
    this.inputFormatters,

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
  State<FTextFieldWithAutoFill> createState() => _FTextFieldWithAutoFillState();
}

class _FTextFieldWithAutoFillState extends State<FTextFieldWithAutoFill> {
  late final FocusNode _node;
  late final bool _internalNode;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _fieldKey = GlobalKey();

  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _node = widget.focusNode ?? FocusNode();
    _internalNode = widget.focusNode == null;
    _node.addListener(_handleFocusChange);
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final input = widget.controller.text.toLowerCase();
    setState(() {
      filteredSuggestions = input.isEmpty
          ? []
          : widget.suggestions
          .where((s) => s.toLowerCase().contains(input))
          .toList();
    });
    _updateOverlay();
    if (widget.onChanged != null) widget.onChanged!(widget.controller.text);
  }

  void _handleFocusChange() {
    if (!_node.hasFocus) {
      _removeOverlay();
    } else if (filteredSuggestions.isNotEmpty) {
      _updateOverlay();
    }
  }

  void _updateOverlay() {
    _removeOverlay();
    if (filteredSuggestions.isNotEmpty && _node.hasFocus) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final targetContext = _fieldKey.currentContext ?? context;
    RenderBox renderBox = targetContext.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height + 5, // يظهر أسفل TextField
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: filteredSuggestions.length,
              separatorBuilder: (_, __) => Divider(height: 1),
              itemBuilder: (context, index) {
                final suggestion = filteredSuggestions[index];
                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    widget.controller.text = suggestion;
                    widget.controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: suggestion.length),
                    );
                    filteredSuggestions = [];
                    _removeOverlay();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_internalNode) _node.dispose();
    widget.controller.removeListener(_onTextChanged);
    _removeOverlay();
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
        CompositedTransformTarget(
          link: _layerLink,
          child: TextFormField(
            key: _fieldKey,
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: _node,
            inputFormatters: widget.inputFormatters,
            enabled: widget.enabled,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
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
        ),
      ],
    );
  }
}
