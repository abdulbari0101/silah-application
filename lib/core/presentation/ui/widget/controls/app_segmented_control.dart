import 'package:flutter/material.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';

class SegmentedItem<T> {
  final T value;
  final String label;

  const SegmentedItem({required this.value, required this.label});
}

class AppSegmentedControl<T> extends StatelessWidget {
  const AppSegmentedControl({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  final List<SegmentedItem<T>> items;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: items.map((item) => _buildItem(context, item)).toList(),
      ),
    );
  }

  Widget _buildItem(BuildContext context, SegmentedItem<T> item) {
    final selected = item.value == value;
    final unselectedText = context.colors.onPrimary.withAlphaOpacity(0.9);
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onChanged(item.value),
        child: AnimatedContainer(
          duration: UIConstants.animationDuration,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected ? context.colors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Text(
              item.label,
              style: context.textTheme.labelLarge?.copyWith(
                color: selected ? context.colors.primary : unselectedText,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
