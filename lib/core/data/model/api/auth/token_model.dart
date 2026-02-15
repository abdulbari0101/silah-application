import 'package:dart_mappable/dart_mappable.dart';
import 'package:silah_app/core/foundation/mapping/mapping_hooks.dart';

part 'token_model.mapper.dart';

@MappableClass(ignoreNull: true)
class TokenModel with TokenModelMappable {
  @MappableField(key: 'access_token')
  final String? accessToken;

  @MappableField(key: 'token_type')
  final String? tokenType;

  @MappableField(key: 'expires_in')
  final int? expiresIn;

  final String? scope;

  final String? error;

  @MappableField(key: 'error_description')
  final String? errorDescription;

  /// Time when the token was obtained.
  /// Back-end can send `created_at` as ISO-8601; otherwise we default to **now**.
  @MappableField(key: 'created_at', hook: DateIsoHook())
  final DateTime createdAt;

  TokenModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.scope,
    this.error,
    this.errorDescription,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// OAuth request succeeded when we got an **accessToken** and no **error**.
  bool get isSuccess => accessToken != null && error == null;

  /// First non-null error message.
  String? get errorMessage => errorDescription ?? error;
}
