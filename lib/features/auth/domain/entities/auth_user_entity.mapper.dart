// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_user_entity.dart';

class AuthAccountTypeMapper extends EnumMapper<AuthAccountType> {
  AuthAccountTypeMapper._();

  static AuthAccountTypeMapper? _instance;
  static AuthAccountTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthAccountTypeMapper._());
    }
    return _instance!;
  }

  static AuthAccountType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthAccountType decode(dynamic value) {
    switch (value) {
      case r'user':
        return AuthAccountType.user;
      case r'lawyer':
        return AuthAccountType.lawyer;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthAccountType self) {
    switch (self) {
      case AuthAccountType.user:
        return r'user';
      case AuthAccountType.lawyer:
        return r'lawyer';
    }
  }
}

extension AuthAccountTypeMapperExtension on AuthAccountType {
  String toValue() {
    AuthAccountTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthAccountType>(this) as String;
  }
}

class AuthUserEntityMapper extends ClassMapperBase<AuthUserEntity> {
  AuthUserEntityMapper._();

  static AuthUserEntityMapper? _instance;
  static AuthUserEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthUserEntityMapper._());
      AuthAccountTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthUserEntity';

  static String? _$uid(AuthUserEntity v) => v.uid;
  static const Field<AuthUserEntity, String> _f$uid = Field(
    'uid',
    _$uid,
    opt: true,
  );
  static String? _$fullName(AuthUserEntity v) => v.fullName;
  static const Field<AuthUserEntity, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
  );
  static String? _$email(AuthUserEntity v) => v.email;
  static const Field<AuthUserEntity, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$phone(AuthUserEntity v) => v.phone;
  static const Field<AuthUserEntity, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
  );
  static AuthAccountType _$accountType(AuthUserEntity v) => v.accountType;
  static const Field<AuthUserEntity, AuthAccountType> _f$accountType = Field(
    'accountType',
    _$accountType,
    opt: true,
    def: AuthAccountType.user,
  );

  @override
  final MappableFields<AuthUserEntity> fields = const {
    #uid: _f$uid,
    #fullName: _f$fullName,
    #email: _f$email,
    #phone: _f$phone,
    #accountType: _f$accountType,
  };
  @override
  final bool ignoreNull = true;

  static AuthUserEntity _instantiate(DecodingData data) {
    return AuthUserEntity(
      uid: data.dec(_f$uid),
      fullName: data.dec(_f$fullName),
      email: data.dec(_f$email),
      phone: data.dec(_f$phone),
      accountType: data.dec(_f$accountType),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthUserEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthUserEntity>(map);
  }

  static AuthUserEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AuthUserEntity>(json);
  }
}

mixin AuthUserEntityMappable {
  String toJsonString() {
    return AuthUserEntityMapper.ensureInitialized().encodeJson<AuthUserEntity>(
      this as AuthUserEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return AuthUserEntityMapper.ensureInitialized().encodeMap<AuthUserEntity>(
      this as AuthUserEntity,
    );
  }

  AuthUserEntityCopyWith<AuthUserEntity, AuthUserEntity, AuthUserEntity>
  get copyWith =>
      _AuthUserEntityCopyWithImpl<AuthUserEntity, AuthUserEntity>(
        this as AuthUserEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthUserEntityMapper.ensureInitialized().stringifyValue(
      this as AuthUserEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthUserEntityMapper.ensureInitialized().equalsValue(
      this as AuthUserEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthUserEntityMapper.ensureInitialized().hashValue(
      this as AuthUserEntity,
    );
  }
}

extension AuthUserEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthUserEntity, $Out> {
  AuthUserEntityCopyWith<$R, AuthUserEntity, $Out> get $asAuthUserEntity =>
      $base.as((v, t, t2) => _AuthUserEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthUserEntityCopyWith<$R, $In extends AuthUserEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? uid,
    String? fullName,
    String? email,
    String? phone,
    AuthAccountType? accountType,
  });
  AuthUserEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AuthUserEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthUserEntity, $Out>
    implements AuthUserEntityCopyWith<$R, AuthUserEntity, $Out> {
  _AuthUserEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthUserEntity> $mapper =
      AuthUserEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? uid = $none,
    Object? fullName = $none,
    Object? email = $none,
    Object? phone = $none,
    Object? accountType = $none,
  }) => $apply(
    FieldCopyWithData({
      if (uid != $none) #uid: uid,
      if (fullName != $none) #fullName: fullName,
      if (email != $none) #email: email,
      if (phone != $none) #phone: phone,
      if (accountType != $none) #accountType: accountType,
    }),
  );
  @override
  AuthUserEntity $make(CopyWithData data) => AuthUserEntity(
    uid: data.get(#uid, or: $value.uid),
    fullName: data.get(#fullName, or: $value.fullName),
    email: data.get(#email, or: $value.email),
    phone: data.get(#phone, or: $value.phone),
    accountType: data.get(#accountType, or: $value.accountType),
  );

  @override
  AuthUserEntityCopyWith<$R2, AuthUserEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthUserEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
