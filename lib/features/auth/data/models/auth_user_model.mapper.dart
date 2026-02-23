// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_user_model.dart';

class AuthUserModelMapper extends ClassMapperBase<AuthUserModel> {
  AuthUserModelMapper._();

  static AuthUserModelMapper? _instance;
  static AuthUserModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthUserModelMapper._());
      AuthAccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthUserModel';

  static String? _$uid(AuthUserModel v) => v.uid;
  static const Field<AuthUserModel, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
  );
  static AuthAccountType _$accountType(AuthUserModel v) => v.accountType;
  static const Field<AuthUserModel, AuthAccountType> _f$accountType = Field(
    'accountType',
    _$accountType,
  );
  static String? _$fullName(AuthUserModel v) => v.fullName;
  static const Field<AuthUserModel, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
  );
  static String? _$email(AuthUserModel v) => v.email;
  static const Field<AuthUserModel, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$phone(AuthUserModel v) => v.phone;
  static const Field<AuthUserModel, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
  );
  static String? _$password(AuthUserModel v) => v.password;
  static const Field<AuthUserModel, String> _f$password = Field(
    'password',
    _$password,
    opt: true,
  );
  static String? _$idToken(AuthUserModel v) => v.idToken;
  static const Field<AuthUserModel, String> _f$idToken = Field(
    'idToken',
    _$idToken,
    opt: true,
  );
  static Map<String, dynamic>? _$profile(AuthUserModel v) => v.profile;
  static const Field<AuthUserModel, Map<String, dynamic>> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
  );

  @override
  final MappableFields<AuthUserModel> fields = const {
    #uid: _f$uid,
    #accountType: _f$accountType,
    #fullName: _f$fullName,
    #email: _f$email,
    #phone: _f$phone,
    #password: _f$password,
    #idToken: _f$idToken,
    #profile: _f$profile,
  };
  @override
  final bool ignoreNull = true;

  static AuthUserModel _instantiate(DecodingData data) {
    return AuthUserModel(
      uid: data.dec(_f$uid),
      accountType: data.dec(_f$accountType),
      fullName: data.dec(_f$fullName),
      email: data.dec(_f$email),
      phone: data.dec(_f$phone),
      password: data.dec(_f$password),
      idToken: data.dec(_f$idToken),
      profile: data.dec(_f$profile),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthUserModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthUserModel>(map);
  }

  static AuthUserModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AuthUserModel>(json);
  }
}

mixin AuthUserModelMappable {
  String toJsonString() {
    return AuthUserModelMapper.ensureInitialized().encodeJson<AuthUserModel>(
      this as AuthUserModel,
    );
  }

  Map<String, dynamic> toJson() {
    return AuthUserModelMapper.ensureInitialized().encodeMap<AuthUserModel>(
      this as AuthUserModel,
    );
  }

  AuthUserModelCopyWith<AuthUserModel, AuthUserModel, AuthUserModel>
  get copyWith => _AuthUserModelCopyWithImpl<AuthUserModel, AuthUserModel>(
    this as AuthUserModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AuthUserModelMapper.ensureInitialized().stringifyValue(
      this as AuthUserModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthUserModelMapper.ensureInitialized().equalsValue(
      this as AuthUserModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthUserModelMapper.ensureInitialized().hashValue(
      this as AuthUserModel,
    );
  }
}

extension AuthUserModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthUserModel, $Out> {
  AuthUserModelCopyWith<$R, AuthUserModel, $Out> get $asAuthUserModel =>
      $base.as((v, t, t2) => _AuthUserModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthUserModelCopyWith<$R, $In extends AuthUserModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get profile;
  $R call({
    String? uid,
    AuthAccountType? accountType,
    String? fullName,
    String? email,
    String? phone,
    String? password,
    String? idToken,
    Map<String, dynamic>? profile,
  });
  AuthUserModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthUserModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthUserModel, $Out>
    implements AuthUserModelCopyWith<$R, AuthUserModel, $Out> {
  _AuthUserModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthUserModel> $mapper =
      AuthUserModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get profile => $value.profile != null
      ? MapCopyWith(
          $value.profile!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(profile: v),
        )
      : null;
  @override
  $R call({
    Object? uid = $none,
    AuthAccountType? accountType,
    Object? fullName = $none,
    Object? email = $none,
    Object? phone = $none,
    Object? password = $none,
    Object? idToken = $none,
    Object? profile = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != $none) #uid: uid,
      if (accountType != null) #accountType: accountType,
      if (fullName != $none) #fullName: fullName,
      if (email != $none) #email: email,
      if (phone != $none) #phone: phone,
      if (password != $none) #password: password,
      if (idToken != $none) #idToken: idToken,
      if (profile != $none) #profile: profile,
    }),
  );
  @override
  AuthUserModel $make(CopyWithData data) => AuthUserModel(
    uid: data.get(#uid, or: $value.uid),
    accountType: data.get(#accountType, or: $value.accountType),
    fullName: data.get(#fullName, or: $value.fullName),
    email: data.get(#email, or: $value.email),
    phone: data.get(#phone, or: $value.phone),
    password: data.get(#password, or: $value.password),
    idToken: data.get(#idToken, or: $value.idToken),
    profile: data.get(#profile, or: $value.profile),
  );

  @override
  AuthUserModelCopyWith<$R2, AuthUserModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthUserModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

