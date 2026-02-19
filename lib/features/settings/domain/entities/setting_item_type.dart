import 'package:dart_mappable/dart_mappable.dart';

part 'setting_item_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum SettingItemType {
  toggle,
  action,
  navigation,
  selection,
}
