// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile_entity.dart';

class ProfileEntityMapper extends ClassMapperBase<ProfileEntity> {
  ProfileEntityMapper._();

  static ProfileEntityMapper? _instance;
  static ProfileEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProfileEntity';

  static String? _$id(ProfileEntity v) => v.id;
  static const Field<ProfileEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$name(ProfileEntity v) => v.name;
  static const Field<ProfileEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$email(ProfileEntity v) => v.email;
  static const Field<ProfileEntity, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$phone(ProfileEntity v) => v.phone;
  static const Field<ProfileEntity, String> _f$phone = Field(
    'phone',
    _$phone,
    opt: true,
  );
  static String? _$city(ProfileEntity v) => v.city;
  static const Field<ProfileEntity, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$avatarUrl(ProfileEntity v) => v.avatarUrl;
  static const Field<ProfileEntity, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    opt: true,
  );
  static String? _$accountType(ProfileEntity v) => v.accountType;
  static const Field<ProfileEntity, String> _f$accountType = Field(
    'accountType',
    _$accountType,
    opt: true,
  );
  static bool _$isTrainee(ProfileEntity v) => v.isTrainee;
  static const Field<ProfileEntity, bool> _f$isTrainee = Field(
    'isTrainee',
    _$isTrainee,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ProfileEntity> fields = const {
    #id: _f$id,
    #name: _f$name,
    #email: _f$email,
    #phone: _f$phone,
    #city: _f$city,
    #avatarUrl: _f$avatarUrl,
    #accountType: _f$accountType,
    #isTrainee: _f$isTrainee,
  };
  @override
  final bool ignoreNull = true;

  static ProfileEntity _instantiate(DecodingData data) {
    return ProfileEntity(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      email: data.dec(_f$email),
      phone: data.dec(_f$phone),
      city: data.dec(_f$city),
      avatarUrl: data.dec(_f$avatarUrl),
      accountType: data.dec(_f$accountType),
      isTrainee: data.dec(_f$isTrainee),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProfileEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProfileEntity>(map);
  }

  static ProfileEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProfileEntity>(json);
  }
}

mixin ProfileEntityMappable {
  String toJsonString() {
    return ProfileEntityMapper.ensureInitialized().encodeJson<ProfileEntity>(
      this as ProfileEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ProfileEntityMapper.ensureInitialized().encodeMap<ProfileEntity>(
      this as ProfileEntity,
    );
  }

  ProfileEntityCopyWith<ProfileEntity, ProfileEntity, ProfileEntity>
  get copyWith => _ProfileEntityCopyWithImpl<ProfileEntity, ProfileEntity>(
    this as ProfileEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ProfileEntityMapper.ensureInitialized().stringifyValue(
      this as ProfileEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProfileEntityMapper.ensureInitialized().equalsValue(
      this as ProfileEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ProfileEntityMapper.ensureInitialized().hashValue(
      this as ProfileEntity,
    );
  }
}

extension ProfileEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProfileEntity, $Out> {
  ProfileEntityCopyWith<$R, ProfileEntity, $Out> get $asProfileEntity =>
      $base.as((v, t, t2) => _ProfileEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProfileEntityCopyWith<$R, $In extends ProfileEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? city,
    String? avatarUrl,
    String? accountType,
    bool? isTrainee,
  });
  ProfileEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProfileEntity, $Out>
    implements ProfileEntityCopyWith<$R, ProfileEntity, $Out> {
  _ProfileEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProfileEntity> $mapper =
      ProfileEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? name = $none,
    Object? email = $none,
    Object? phone = $none,
    Object? city = $none,
    Object? avatarUrl = $none,
    Object? accountType = $none,
    bool? isTrainee,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != $none) #name: name,
      if (email != $none) #email: email,
      if (phone != $none) #phone: phone,
      if (city != $none) #city: city,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
      if (accountType != $none) #accountType: accountType,
      if (isTrainee != null) #isTrainee: isTrainee,
    }),
  );
  @override
  ProfileEntity $make(CopyWithData data) => ProfileEntity(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    email: data.get(#email, or: $value.email),
    phone: data.get(#phone, or: $value.phone),
    city: data.get(#city, or: $value.city),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
    accountType: data.get(#accountType, or: $value.accountType),
    isTrainee: data.get(#isTrainee, or: $value.isTrainee),
  );

  @override
  ProfileEntityCopyWith<$R2, ProfileEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProfileEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

