import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/data/model/api/base/response_wrapper.dart';
import 'package:silah_app/core/data/model/api/result_model.dart';

import 'intro_model.dart';

part 'intro_response_wrapper.mapper.dart';

// lib/features/auth/data/model/intro_response_wrapper.dart

@MappableClass(ignoreNull: true)
class IntroRespWrapper extends BaseRespWrapper with IntroRespWrapperMappable {
  @MappableField(key: 'Intro')
  final List<IntroModel>? Intro;

  const IntroRespWrapper({this.Intro, super.result});
}
