import 'package:dart_mappable/dart_mappable.dart';
part 'intro_entity.mapper.dart';
@MappableClass()
class IntroEntity with IntroEntityMappable {
  final String? name;

  const IntroEntity({this.name});

  
}
