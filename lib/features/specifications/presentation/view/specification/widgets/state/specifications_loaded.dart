import 'package:flutter/material.dart';
import 'package:silah_app/features/specifications/domain/entities/specification_item_entity.dart';
import 'package:silah_app/features/specifications/presentation/view/specification/widgets/item/specification_item.dart';

class OperatorsLoaded extends StatelessWidget {
  const OperatorsLoaded({super.key, required this.data});

  final List<SpecificationItemEntity> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.98,
          ),
          itemBuilder: (context, index) {
            final item = data[index];

            return SpecificationItem(enabled: true, onTap: () {}, item: item);
          },
        );
      },
    );
  }
}
