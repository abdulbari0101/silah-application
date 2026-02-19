import 'package:dart_mappable/dart_mappable.dart';

import 'setting_item_entity.dart';

part 'setting_section_entity.mapper.dart';

@MappableClass()
class SettingSectionEntity with SettingSectionEntityMappable {
  final String title;
  final List<SettingItemEntity> items;

  const SettingSectionEntity({
    required this.title,
    required this.items,
  });
}
