import 'package:dart_mappable/dart_mappable.dart';

part 'result_entity.mapper.dart';

@MappableClass()
class ResultEntity with ResultEntityMappable {
  final String? errorMessage;
  final int? errorNumber;

  const ResultEntity({this.errorMessage, this.errorNumber});
}
