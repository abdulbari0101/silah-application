import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/features/Intro/domain/entities/intro_entity.dart';

part 'intro_model.mapper.dart';

@MappableClass(ignoreNull: true)
class IntroModel with IntroModelMappable {
  @MappableField(key: 'name')
  final String? name;

  const IntroModel({this.name});

  IntroEntity toEntity() => IntroEntity(name: name);

  factory IntroModel.fromEntity(IntroEntity entity) => IntroModel(name: entity.name);
}
