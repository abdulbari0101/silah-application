import 'package:flutter/material.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class LabeledValueRow extends StatelessWidget {
  const LabeledValueRow({
    super.key,
    required this.label,
    required this.value,
    this.padding = EdgeInsets.zero,
    this.spacing = 8,
    this.labelSuffix = '',
    this.labelWidth,
    this.labelFlex,
    this.valueFlex,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.labelStyle,
    this.valueStyle,
  });

  final String label;
  final String value;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final String labelSuffix;
  final double? labelWidth;
  final int? labelFlex;
  final int? valueFlex;
  final CrossAxisAlignment crossAxisAlignment;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    final resolvedLabelStyle =
        labelStyle ??
        context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600);
    final resolvedValueStyle =
        valueStyle ??
        context.textTheme.bodySmall?.copyWith(
          color: context.colors.onSurfaceVariant,
        );

    final labelWidget = Text('$label$labelSuffix', style: resolvedLabelStyle);
    final valueWidget = Text(value, style: resolvedValueStyle);

    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          _buildLabel(labelWidget),
          SizedBox(width: spacing),
          _buildValue(valueWidget),
        ],
      ),
    );
  }

  Widget _buildLabel(Widget child) {
    if (labelWidth != null) {
      return SizedBox(width: labelWidth, child: child);
    }
    if (labelFlex != null) {
      return Expanded(flex: labelFlex!, child: child);
    }
    return child;
  }

  Widget _buildValue(Widget child) {
    if (valueFlex != null) {
      return Expanded(flex: valueFlex!, child: child);
    }
    return Expanded(child: child);
  }
}
