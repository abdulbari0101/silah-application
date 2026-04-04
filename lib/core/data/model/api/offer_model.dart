import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/domain/entities/api/offer_entity.dart';

part 'offer_model.mapper.dart';

@MappableClass(ignoreNull: true)
class OfferModel with OfferModelMappable {
  @MappableField(key: 'NO')
  final int? no;

  @MappableField(key: 'LINK')
  final String? link;

  @MappableField(key: 'DESC')
  final String? desc;

  @MappableField(key: 'TITLE')
  final String? title;

  @MappableField(key: 'NAME')
  final String? name;

  final int? language;

  const OfferModel({
    this.language,
    this.no,
    this.link,
    this.desc,
    this.name,
    this.title,
  });

  OfferEntity toEntity() =>
      OfferEntity(no: no, link: link, desc: desc, name: name, title: title);

  factory OfferModel.fromEntity(OfferEntity entity) => OfferModel(
    no: entity.no,
    link: entity.link,
    desc: entity.desc,
    name: entity.name,
    title: entity.title,
  );
}
