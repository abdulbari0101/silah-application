import 'package:dart_mappable/dart_mappable.dart';

part 'message_type.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.lowerCase)
enum MessageType {
  text,
  image,
  file,
  system,
}
