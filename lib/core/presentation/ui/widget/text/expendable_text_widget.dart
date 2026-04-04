import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;
  final int trimLines;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
    this.trimLines = 2,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = widget.style ?? context.textTheme.bodyMedium;

    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: effectiveTextStyle),
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
      textAlign: widget.textAlign,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        textPainter.layout(maxWidth: constraints.maxWidth * 0.7);

        final bool isTextOverflowing = textPainter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: widget.textAlign == TextAlign.center
              ? CrossAxisAlignment.center
              : widget.textAlign == TextAlign.end ||
                    widget.textAlign == TextAlign.right
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.text,
              style: effectiveTextStyle,
              textAlign: widget.textAlign,
              maxLines: _isExpanded ? null : widget.trimLines,
              overflow: TextOverflow.fade,
            ),
            if (isTextOverflowing)
              GestureDetector(
                onTap: _toggleExpanded,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
