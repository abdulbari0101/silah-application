import 'package:dart_mappable/dart_mappable.dart';

import 'setting_item_type.dart';

part 'setting_item_entity.mapper.dart';

@MappableClass()
class SettingItemEntity with SettingItemEntityMappable {
  final String key;
  final String title;
  final String? description;
  final SettingItemType type;
  final dynamic value;

  const SettingItemEntity({
    required this.key,
    required this.title,
    this.description,
    required this.type,
    this.value,
  });
}
