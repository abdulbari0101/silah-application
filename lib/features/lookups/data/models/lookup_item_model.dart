import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/lookups/domain/entities/lookup_item_entity.dart';

part 'lookup_item_model.mapper.dart';

@MappableClass(ignoreNull: true)
class LookupItemModel with LookupItemModelMappable {
  final String? id;
  final String? nameAr;
  final String? nameEn;
  final String? iconUrl;
  final String? countryId;

  const LookupItemModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.iconUrl,
    this.countryId,
  });

  LookupItemEntity toEntity() => LookupItemEntity(
    id: id,
    nameAr: nameAr,
    nameEn: nameEn,
    iconUrl: iconUrl,
    countryId: countryId,
  );
}
