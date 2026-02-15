// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token_request.dart';

class TokenRequestMapper extends ClassMapperBase<TokenRequest> {
  TokenRequestMapper._();

  static TokenRequestMapper? _instance;
  static TokenRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TokenRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TokenRequest';

  static String _$grantType(TokenRequest v) => v.grantType;
  static const Field<TokenRequest, String> _f$grantType = Field(
    'grantType',
    _$grantType,
  );
  static String _$username(TokenRequest v) => v.username;
  static const Field<TokenRequest, String> _f$username = Field(
    'username',
    _$username,
  );
  static String _$password(TokenRequest v) => v.password;
  static const Field<TokenRequest, String> _f$password = Field(
    'password',
    _$password,
  );
  static String _$scope(TokenRequest v) => v.scope;
  static const Field<TokenRequest, String> _f$scope = Field('scope', _$scope);
  static String _$clientId(TokenRequest v) => v.clientId;
  static const Field<TokenRequest, String> _f$clientId = Field(
    'clientId',
    _$clientId,
  );
  static String _$clientSecret(TokenRequest v) => v.clientSecret;
  static const Field<TokenRequest, String> _f$clientSecret = Field(
    'clientSecret',
    _$clientSecret,
  );

  @override
  final MappableFields<TokenRequest> fields = const {
    #grantType: _f$grantType,
    #username: _f$username,
    #password: _f$password,
    #scope: _f$scope,
    #clientId: _f$clientId,
    #clientSecret: _f$clientSecret,
  };
  @override
  final bool ignoreNull = true;

  static TokenRequest _instantiate(DecodingData data) {
    return TokenRequest(
      grantType: data.dec(_f$grantType),
      username: data.dec(_f$username),
      password: data.dec(_f$password),
      scope: data.dec(_f$scope),
      clientId: data.dec(_f$clientId),
      clientSecret: data.dec(_f$clientSecret),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TokenRequest fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenRequest>(map);
  }

  static TokenRequest fromJsonString(String json) {
    return ensureInitialized().decodeJson<TokenRequest>(json);
  }
}

mixin TokenRequestMappable {
  String toJsonString() {
    return TokenRequestMapper.ensureInitialized().encodeJson<TokenRequest>(
      this as TokenRequest,
    );
  }

  Map<String, dynamic> toJson() {
    return TokenRequestMapper.ensureInitialized().encodeMap<TokenRequest>(
      this as TokenRequest,
    );
  }

  TokenRequestCopyWith<TokenRequest, TokenRequest, TokenRequest> get copyWith =>
      _TokenRequestCopyWithImpl<TokenRequest, TokenRequest>(
        this as TokenRequest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TokenRequestMapper.ensureInitialized().stringifyValue(
      this as TokenRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return TokenRequestMapper.ensureInitialized().equalsValue(
      this as TokenRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return TokenRequestMapper.ensureInitialized().hashValue(
      this as TokenRequest,
    );
  }
}

extension TokenRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenRequest, $Out> {
  TokenRequestCopyWith<$R, TokenRequest, $Out> get $asTokenRequest =>
      $base.as((v, t, t2) => _TokenRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TokenRequestCopyWith<$R, $In extends TokenRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? grantType,
    String? username,
    String? password,
    String? scope,
    String? clientId,
    String? clientSecret,
  });
  TokenRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenRequest, $Out>
    implements TokenRequestCopyWith<$R, TokenRequest, $Out> {
  _TokenRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TokenRequest> $mapper =
      TokenRequestMapper.ensureInitialized();
  @override
  $R call({
    String? grantType,
    String? username,
    String? password,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) => $apply(
    FieldCopyWithData({
      if (grantType != null) #grantType: grantType,
      if (username != null) #username: username,
      if (password != null) #password: password,
      if (scope != null) #scope: scope,
      if (clientId != null) #clientId: clientId,
      if (clientSecret != null) #clientSecret: clientSecret,
    }),
  );
  @override
  TokenRequest $make(CopyWithData data) => TokenRequest(
    grantType: data.get(#grantType, or: $value.grantType),
    username: data.get(#username, or: $value.username),
    password: data.get(#password, or: $value.password),
    scope: data.get(#scope, or: $value.scope),
    clientId: data.get(#clientId, or: $value.clientId),
    clientSecret: data.get(#clientSecret, or: $value.clientSecret),
  );

  @override
  TokenRequestCopyWith<$R2, TokenRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TokenRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

