import 'package:dart_mappable/dart_mappable.dart';

part 'ai_classification_request_entity.mapper.dart';

@MappableClass()
class AiClassificationRequestEntity with AiClassificationRequestEntityMappable {
  final String prompt;
  final String? languageCode;

  const AiClassificationRequestEntity({
    required this.prompt,
    this.languageCode,
  });
}
