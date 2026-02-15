import 'package:dart_mappable/dart_mappable.dart';

part 'token_request.mapper.dart';

@MappableClass()
class TokenRequest with TokenRequestMappable {
  final String grantType;
  final String username;
  final String password;
  final String scope;
  final String clientId;
  final String clientSecret;

  const TokenRequest({
    required this.grantType,
    required this.username,
    required this.password,
    required this.scope,
    required this.clientId,
    required this.clientSecret,
  });
}
