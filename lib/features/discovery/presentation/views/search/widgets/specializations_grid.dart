import 'package:flutter/material.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/specialization_tile.dart';

class SpecializationsGrid extends StatelessWidget {
  const SpecializationsGrid({
    super.key,
    required this.items,
    required this.selectedId,
    required this.onSelect,
  });

  final List<LegalSpecializationEntity> items;
  final String? selectedId;
  final ValueChanged<LegalSpecializationEntity> onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.05,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return SpecializationTile(
          specialization: item,
          selected: selectedId == item.id,
          icon: _icons[index % _icons.length],
          onTap: () => onSelect(item),
        );
      },
    );
  }
}

final List<IconData> _icons = [
  Icons.shopping_cart_outlined,
  Icons.person_outline,
  Icons.gavel_outlined,
  Icons.assignment_outlined,
  Icons.account_balance_outlined,
  Icons.description_outlined,
  Icons.public_outlined,
  Icons.lightbulb_outline,
];
