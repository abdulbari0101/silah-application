import 'package:dart_mappable/dart_mappable.dart';

import '../../../domain/entities/api/result_entity.dart';

part 'result_model.mapper.dart';

@MappableClass(ignoreNull: true)
class ResultModel with ResultModelMappable {
  @MappableField(key: 'ErrorNa')
  final String? errorMessage;

  @MappableField(key: 'ErrorMessage')
  final String? errorMessageAlt;

  @MappableField(key: 'ErrorNo')
  final int? errorNumber;

  @MappableField(key: 'ErrorNumber')
  final int? errorNumberAlt;

  const ResultModel({
    this.errorMessage,
    this.errorMessageAlt,
    this.errorNumber,
    this.errorNumberAlt,
  });

  String? get message => errorMessage ?? errorMessageAlt;
  int? get code => errorNumber ?? errorNumberAlt;

  ResultEntity toEntity() => ResultEntity(errorMessage: message, errorNumber: code);

  factory ResultModel.fromEntity(ResultEntity entity) => ResultModel(
    errorMessage: entity.errorMessage,
    errorNumber: entity.errorNumber,
  );
}
