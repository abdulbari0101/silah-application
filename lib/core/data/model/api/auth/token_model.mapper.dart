// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'token_model.dart';

class TokenModelMapper extends ClassMapperBase<TokenModel> {
  TokenModelMapper._();

  static TokenModelMapper? _instance;
  static TokenModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TokenModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TokenModel';

  static String? _$accessToken(TokenModel v) => v.accessToken;
  static const Field<TokenModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
    opt: true,
  );
  static String? _$tokenType(TokenModel v) => v.tokenType;
  static const Field<TokenModel, String> _f$tokenType = Field(
    'tokenType',
    _$tokenType,
    key: r'token_type',
    opt: true,
  );
  static int? _$expiresIn(TokenModel v) => v.expiresIn;
  static const Field<TokenModel, int> _f$expiresIn = Field(
    'expiresIn',
    _$expiresIn,
    key: r'expires_in',
    opt: true,
  );
  static String? _$scope(TokenModel v) => v.scope;
  static const Field<TokenModel, String> _f$scope = Field(
    'scope',
    _$scope,
    opt: true,
  );
  static String? _$error(TokenModel v) => v.error;
  static const Field<TokenModel, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static String? _$errorDescription(TokenModel v) => v.errorDescription;
  static const Field<TokenModel, String> _f$errorDescription = Field(
    'errorDescription',
    _$errorDescription,
    key: r'error_description',
    opt: true,
  );
  static DateTime _$createdAt(TokenModel v) => v.createdAt;
  static const Field<TokenModel, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
    hook: DateIsoHook(),
  );

  @override
  final MappableFields<TokenModel> fields = const {
    #accessToken: _f$accessToken,
    #tokenType: _f$tokenType,
    #expiresIn: _f$expiresIn,
    #scope: _f$scope,
    #error: _f$error,
    #errorDescription: _f$errorDescription,
    #createdAt: _f$createdAt,
  };
  @override
  final bool ignoreNull = true;

  static TokenModel _instantiate(DecodingData data) {
    return TokenModel(
      accessToken: data.dec(_f$accessToken),
      tokenType: data.dec(_f$tokenType),
      expiresIn: data.dec(_f$expiresIn),
      scope: data.dec(_f$scope),
      error: data.dec(_f$error),
      errorDescription: data.dec(_f$errorDescription),
      createdAt: data.dec(_f$createdAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TokenModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TokenModel>(map);
  }

  static TokenModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<TokenModel>(json);
  }
}

mixin TokenModelMappable {
  String toJsonString() {
    return TokenModelMapper.ensureInitialized().encodeJson<TokenModel>(
      this as TokenModel,
    );
  }

  Map<String, dynamic> toJson() {
    return TokenModelMapper.ensureInitialized().encodeMap<TokenModel>(
      this as TokenModel,
    );
  }

  TokenModelCopyWith<TokenModel, TokenModel, TokenModel> get copyWith =>
      _TokenModelCopyWithImpl<TokenModel, TokenModel>(
        this as TokenModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TokenModelMapper.ensureInitialized().stringifyValue(
      this as TokenModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return TokenModelMapper.ensureInitialized().equalsValue(
      this as TokenModel,
      other,
    );
  }

  @override
  int get hashCode {
    return TokenModelMapper.ensureInitialized().hashValue(this as TokenModel);
  }
}

extension TokenModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TokenModel, $Out> {
  TokenModelCopyWith<$R, TokenModel, $Out> get $asTokenModel =>
      $base.as((v, t, t2) => _TokenModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TokenModelCopyWith<$R, $In extends TokenModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? accessToken,
    String? tokenType,
    int? expiresIn,
    String? scope,
    String? error,
    String? errorDescription,
    DateTime? createdAt,
  });
  TokenModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TokenModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TokenModel, $Out>
    implements TokenModelCopyWith<$R, TokenModel, $Out> {
  _TokenModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TokenModel> $mapper =
      TokenModelMapper.ensureInitialized();
  @override
  $R call({
    Object? accessToken = $none,
    Object? tokenType = $none,
    Object? expiresIn = $none,
    Object? scope = $none,
    Object? error = $none,
    Object? errorDescription = $none,
    Object? createdAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != $none) #accessToken: accessToken,
      if (tokenType != $none) #tokenType: tokenType,
      if (expiresIn != $none) #expiresIn: expiresIn,
      if (scope != $none) #scope: scope,
      if (error != $none) #error: error,
      if (errorDescription != $none) #errorDescription: errorDescription,
      if (createdAt != $none) #createdAt: createdAt,
    }),
  );
  @override
  TokenModel $make(CopyWithData data) => TokenModel(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    tokenType: data.get(#tokenType, or: $value.tokenType),
    expiresIn: data.get(#expiresIn, or: $value.expiresIn),
    scope: data.get(#scope, or: $value.scope),
    error: data.get(#error, or: $value.error),
    errorDescription: data.get(#errorDescription, or: $value.errorDescription),
    createdAt: data.get(#createdAt, or: $value.createdAt),
  );

  @override
  TokenModelCopyWith<$R2, TokenModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TokenModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

