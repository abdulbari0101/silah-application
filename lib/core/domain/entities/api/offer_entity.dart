import 'package:dart_mappable/dart_mappable.dart';

part 'offer_entity.mapper.dart';

@MappableClass(ignoreNull: true)
class OfferEntity with OfferEntityMappable {
  final int? no;

  final String? link;

  final String? desc;

  final String? title;

  final String? name;

  final int? language;

  const OfferEntity({this.language, this.no, this.link, this.desc, this.name, this.title});
}
