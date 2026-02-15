import 'package:dart_mappable/dart_mappable.dart';
part 'self_register_token_model.mapper.dart';

@MappableClass(ignoreNull: true)
class SelfRegisterTokenModel with SelfRegisterTokenModelMappable {
  @MappableField(key: 'access_token')
  final String? accessToken;

  @MappableField(key: 'token_type')
  final String? tokenType;

  const SelfRegisterTokenModel({this.accessToken, this.tokenType});

  }
