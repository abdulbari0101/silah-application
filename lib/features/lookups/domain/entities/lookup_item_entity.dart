import 'package:dart_mappable/dart_mappable.dart';

part 'lookup_item_entity.mapper.dart';

@MappableClass()
class LookupItemEntity with LookupItemEntityMappable {
  final String? id;
  final String? nameAr;
  final String? nameEn;
  final String? iconUrl;
  final String? countryId;

  const LookupItemEntity({
    this.id,
    this.nameAr,
    this.nameEn,
    this.iconUrl,
    this.countryId,
  });
}
