// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_state_data.dart';

class AppStateDataMapper extends ClassMapperBase<AppStateData> {
  AppStateDataMapper._();

  static AppStateDataMapper? _instance;
  static AppStateDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateDataMapper._());
      CustomerEntityMapper.ensureInitialized();
      UserAuthStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppStateData';

  static bool _$isLoggedIn(AppStateData v) => v.isLoggedIn;
  static const Field<AppStateData, bool> _f$isLoggedIn = Field(
    'isLoggedIn',
    _$isLoggedIn,
    opt: true,
    def: false,
  );
  static CustomerEntity? _$customer(AppStateData v) => v.customer;
  static const Field<AppStateData, CustomerEntity> _f$customer = Field(
    'customer',
    _$customer,
    opt: true,
  );
  static UserAuthStatus _$userAuthStatus(AppStateData v) => v.userAuthStatus;
  static const Field<AppStateData, UserAuthStatus> _f$userAuthStatus = Field(
    'userAuthStatus',
    _$userAuthStatus,
    opt: true,
  );

  @override
  final MappableFields<AppStateData> fields = const {
    #isLoggedIn: _f$isLoggedIn,
    #customer: _f$customer,
    #userAuthStatus: _f$userAuthStatus,
  };
  @override
  final bool ignoreNull = true;

  static AppStateData _instantiate(DecodingData data) {
    return AppStateData(
      isLoggedIn: data.dec(_f$isLoggedIn),
      customer: data.dec(_f$customer),
      userAuthStatus: data.dec(_f$userAuthStatus),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppStateData fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppStateData>(map);
  }

  static AppStateData fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppStateData>(json);
  }
}

mixin AppStateDataMappable {
  String toJsonString() {
    return AppStateDataMapper.ensureInitialized().encodeJson<AppStateData>(
      this as AppStateData,
    );
  }

  Map<String, dynamic> toJson() {
    return AppStateDataMapper.ensureInitialized().encodeMap<AppStateData>(
      this as AppStateData,
    );
  }

  AppStateDataCopyWith<AppStateData, AppStateData, AppStateData> get copyWith =>
      _AppStateDataCopyWithImpl<AppStateData, AppStateData>(
        this as AppStateData,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppStateDataMapper.ensureInitialized().stringifyValue(
      this as AppStateData,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppStateDataMapper.ensureInitialized().equalsValue(
      this as AppStateData,
      other,
    );
  }

  @override
  int get hashCode {
    return AppStateDataMapper.ensureInitialized().hashValue(
      this as AppStateData,
    );
  }
}

extension AppStateDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppStateData, $Out> {
  AppStateDataCopyWith<$R, AppStateData, $Out> get $asAppStateData =>
      $base.as((v, t, t2) => _AppStateDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppStateDataCopyWith<$R, $In extends AppStateData, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer;
  $R call({
    bool? isLoggedIn,
    CustomerEntity? customer,
    UserAuthStatus? userAuthStatus,
  });
  AppStateDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppStateDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppStateData, $Out>
    implements AppStateDataCopyWith<$R, AppStateData, $Out> {
  _AppStateDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppStateData> $mapper =
      AppStateDataMapper.ensureInitialized();
  @override
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  $R call({
    bool? isLoggedIn,
    Object? customer = $none,
    Object? userAuthStatus = $none,
  }) => $apply(
    FieldCopyWithData({
      if (isLoggedIn != null) #isLoggedIn: isLoggedIn,
      if (customer != $none) #customer: customer,
      if (userAuthStatus != $none) #userAuthStatus: userAuthStatus,
    }),
  );
  @override
  AppStateData $make(CopyWithData data) => AppStateData(
    isLoggedIn: data.get(#isLoggedIn, or: $value.isLoggedIn),
    customer: data.get(#customer, or: $value.customer),
    userAuthStatus: data.get(#userAuthStatus, or: $value.userAuthStatus),
  );

  @override
  AppStateDataCopyWith<$R2, AppStateData, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppStateDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

