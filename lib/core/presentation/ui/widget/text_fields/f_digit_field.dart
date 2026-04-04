import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class FDigitField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final bool enabled;
  final int length;
  final double spacing;

  const FDigitField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.onCompleted,
    this.enabled = true,
    this.length = 6,
    this.spacing = 24,
  });

  @override
  _FDigitFieldState createState() => _FDigitFieldState();
}

class _FDigitFieldState extends State<FDigitField> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.enabled) {
        widget.focusNode.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.focusNode.requestFocus();
      },
      behavior: HitTestBehavior.translucent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.length, (index) {
              bool isFilled = index < widget.controller.text.length;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !widget.enabled
                        ? context.colors.surfaceContainer.withAlphaOpacity(.6)
                        : isFilled
                        ? context.colors.primary
                        : context.colors.greyDark(),
                  ),
                ),
              );
            }),
          ),

          Offstage(
            offstage: false,
            child: SizedBox(
              width: 0.1,
              height: 0.1,
              child: TextField(
                focusNode: widget.focusNode,
                controller: widget.controller,
                // keyboardType: TextInputType.number,
                maxLength: widget.length,
                onChanged: (value) {
                  setState(() {});
                  widget.onChanged?.call(value);
                  if (value.length == widget.length) {
                    widget.onCompleted?.call(value);
                  }
                },
                // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
