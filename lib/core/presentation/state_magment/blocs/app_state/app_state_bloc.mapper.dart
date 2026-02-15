// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_state_bloc.dart';

class AppStateEventMapper extends ClassMapperBase<AppStateEvent> {
  AppStateEventMapper._();

  static AppStateEventMapper? _instance;
  static AppStateEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateEventMapper._());
      UpdateSessionMapper.ensureInitialized();
      UserLoggedInMapper.ensureInitialized();
      InjectDataBeforeAppStartMapper.ensureInitialized();
      SyncLocalDataToAppStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppStateEvent';

  @override
  final MappableFields<AppStateEvent> fields = const {};
  @override
  final bool ignoreNull = true;

  static AppStateEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'AppStateEvent',
      'event',
      '${data.value['event']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppStateEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppStateEvent>(map);
  }

  static AppStateEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppStateEvent>(json);
  }
}

mixin AppStateEventMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  AppStateEventCopyWith<AppStateEvent, AppStateEvent, AppStateEvent>
  get copyWith;
}

abstract class AppStateEventCopyWith<$R, $In extends AppStateEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AppStateEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class UpdateSessionMapper extends SubClassMapperBase<UpdateSession> {
  UpdateSessionMapper._();

  static UpdateSessionMapper? _instance;
  static UpdateSessionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpdateSessionMapper._());
      AppStateEventMapper.ensureInitialized().addSubMapper(_instance!);
      ExDataAuthEntityMapper.ensureInitialized();
      UserAuthStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UpdateSession';

  static ExDataAuthEntity? _$authData(UpdateSession v) => v.authData;
  static const Field<UpdateSession, ExDataAuthEntity> _f$authData = Field(
    'authData',
    _$authData,
    opt: true,
  );
  static bool? _$isLoggedIn(UpdateSession v) => v.isLoggedIn;
  static const Field<UpdateSession, bool> _f$isLoggedIn = Field(
    'isLoggedIn',
    _$isLoggedIn,
    opt: true,
  );
  static UserAuthStatus? _$userAuthStatus(UpdateSession v) => v.userAuthStatus;
  static const Field<UpdateSession, UserAuthStatus> _f$userAuthStatus = Field(
    'userAuthStatus',
    _$userAuthStatus,
    opt: true,
  );

  @override
  final MappableFields<UpdateSession> fields = const {
    #authData: _f$authData,
    #isLoggedIn: _f$isLoggedIn,
    #userAuthStatus: _f$userAuthStatus,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'update_session';
  @override
  late final ClassMapperBase superMapper =
      AppStateEventMapper.ensureInitialized();

  static UpdateSession _instantiate(DecodingData data) {
    return UpdateSession(
      authData: data.dec(_f$authData),
      isLoggedIn: data.dec(_f$isLoggedIn),
      userAuthStatus: data.dec(_f$userAuthStatus),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UpdateSession fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpdateSession>(map);
  }

  static UpdateSession fromJsonString(String json) {
    return ensureInitialized().decodeJson<UpdateSession>(json);
  }
}

mixin UpdateSessionMappable {
  String toJsonString() {
    return UpdateSessionMapper.ensureInitialized().encodeJson<UpdateSession>(
      this as UpdateSession,
    );
  }

  Map<String, dynamic> toJson() {
    return UpdateSessionMapper.ensureInitialized().encodeMap<UpdateSession>(
      this as UpdateSession,
    );
  }

  UpdateSessionCopyWith<UpdateSession, UpdateSession, UpdateSession>
  get copyWith => _UpdateSessionCopyWithImpl<UpdateSession, UpdateSession>(
    this as UpdateSession,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return UpdateSessionMapper.ensureInitialized().stringifyValue(
      this as UpdateSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return UpdateSessionMapper.ensureInitialized().equalsValue(
      this as UpdateSession,
      other,
    );
  }

  @override
  int get hashCode {
    return UpdateSessionMapper.ensureInitialized().hashValue(
      this as UpdateSession,
    );
  }
}

extension UpdateSessionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpdateSession, $Out> {
  UpdateSessionCopyWith<$R, UpdateSession, $Out> get $asUpdateSession =>
      $base.as((v, t, t2) => _UpdateSessionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UpdateSessionCopyWith<$R, $In extends UpdateSession, $Out>
    implements AppStateEventCopyWith<$R, $In, $Out> {
  ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, ExDataAuthEntity>?
  get authData;
  @override
  $R call({
    ExDataAuthEntity? authData,
    bool? isLoggedIn,
    UserAuthStatus? userAuthStatus,
  });
  UpdateSessionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UpdateSessionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpdateSession, $Out>
    implements UpdateSessionCopyWith<$R, UpdateSession, $Out> {
  _UpdateSessionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpdateSession> $mapper =
      UpdateSessionMapper.ensureInitialized();
  @override
  ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, ExDataAuthEntity>?
  get authData => $value.authData?.copyWith.$chain((v) => call(authData: v));
  @override
  $R call({
    Object? authData = $none,
    Object? isLoggedIn = $none,
    Object? userAuthStatus = $none,
  }) => $apply(
    FieldCopyWithData({
      if (authData != $none) #authData: authData,
      if (isLoggedIn != $none) #isLoggedIn: isLoggedIn,
      if (userAuthStatus != $none) #userAuthStatus: userAuthStatus,
    }),
  );
  @override
  UpdateSession $make(CopyWithData data) => UpdateSession(
    authData: data.get(#authData, or: $value.authData),
    isLoggedIn: data.get(#isLoggedIn, or: $value.isLoggedIn),
    userAuthStatus: data.get(#userAuthStatus, or: $value.userAuthStatus),
  );

  @override
  UpdateSessionCopyWith<$R2, UpdateSession, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UpdateSessionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserLoggedInMapper extends SubClassMapperBase<UserLoggedIn> {
  UserLoggedInMapper._();

  static UserLoggedInMapper? _instance;
  static UserLoggedInMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserLoggedInMapper._());
      AppStateEventMapper.ensureInitialized().addSubMapper(_instance!);
      ExDataAuthEntityMapper.ensureInitialized();
      UserAuthStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserLoggedIn';

  static ExDataAuthEntity? _$authData(UserLoggedIn v) => v.authData;
  static const Field<UserLoggedIn, ExDataAuthEntity> _f$authData = Field(
    'authData',
    _$authData,
  );
  static UserAuthStatus? _$userAuthStatus(UserLoggedIn v) => v.userAuthStatus;
  static const Field<UserLoggedIn, UserAuthStatus> _f$userAuthStatus = Field(
    'userAuthStatus',
    _$userAuthStatus,
  );

  @override
  final MappableFields<UserLoggedIn> fields = const {
    #authData: _f$authData,
    #userAuthStatus: _f$userAuthStatus,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'user_logged_in';
  @override
  late final ClassMapperBase superMapper =
      AppStateEventMapper.ensureInitialized();

  static UserLoggedIn _instantiate(DecodingData data) {
    return UserLoggedIn(
      authData: data.dec(_f$authData),
      userAuthStatus: data.dec(_f$userAuthStatus),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserLoggedIn fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserLoggedIn>(map);
  }

  static UserLoggedIn fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserLoggedIn>(json);
  }
}

mixin UserLoggedInMappable {
  String toJsonString() {
    return UserLoggedInMapper.ensureInitialized().encodeJson<UserLoggedIn>(
      this as UserLoggedIn,
    );
  }

  Map<String, dynamic> toJson() {
    return UserLoggedInMapper.ensureInitialized().encodeMap<UserLoggedIn>(
      this as UserLoggedIn,
    );
  }

  UserLoggedInCopyWith<UserLoggedIn, UserLoggedIn, UserLoggedIn> get copyWith =>
      _UserLoggedInCopyWithImpl<UserLoggedIn, UserLoggedIn>(
        this as UserLoggedIn,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserLoggedInMapper.ensureInitialized().stringifyValue(
      this as UserLoggedIn,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserLoggedInMapper.ensureInitialized().equalsValue(
      this as UserLoggedIn,
      other,
    );
  }

  @override
  int get hashCode {
    return UserLoggedInMapper.ensureInitialized().hashValue(
      this as UserLoggedIn,
    );
  }
}

extension UserLoggedInValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserLoggedIn, $Out> {
  UserLoggedInCopyWith<$R, UserLoggedIn, $Out> get $asUserLoggedIn =>
      $base.as((v, t, t2) => _UserLoggedInCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserLoggedInCopyWith<$R, $In extends UserLoggedIn, $Out>
    implements AppStateEventCopyWith<$R, $In, $Out> {
  ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, ExDataAuthEntity>?
  get authData;
  @override
  $R call({ExDataAuthEntity? authData, UserAuthStatus? userAuthStatus});
  UserLoggedInCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserLoggedInCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserLoggedIn, $Out>
    implements UserLoggedInCopyWith<$R, UserLoggedIn, $Out> {
  _UserLoggedInCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserLoggedIn> $mapper =
      UserLoggedInMapper.ensureInitialized();
  @override
  ExDataAuthEntityCopyWith<$R, ExDataAuthEntity, ExDataAuthEntity>?
  get authData => $value.authData?.copyWith.$chain((v) => call(authData: v));
  @override
  $R call({Object? authData = $none, Object? userAuthStatus = $none}) => $apply(
    FieldCopyWithData({
      if (authData != $none) #authData: authData,
      if (userAuthStatus != $none) #userAuthStatus: userAuthStatus,
    }),
  );
  @override
  UserLoggedIn $make(CopyWithData data) => UserLoggedIn(
    authData: data.get(#authData, or: $value.authData),
    userAuthStatus: data.get(#userAuthStatus, or: $value.userAuthStatus),
  );

  @override
  UserLoggedInCopyWith<$R2, UserLoggedIn, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserLoggedInCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class InjectDataBeforeAppStartMapper
    extends SubClassMapperBase<InjectDataBeforeAppStart> {
  InjectDataBeforeAppStartMapper._();

  static InjectDataBeforeAppStartMapper? _instance;
  static InjectDataBeforeAppStartMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = InjectDataBeforeAppStartMapper._(),
      );
      AppStateEventMapper.ensureInitialized().addSubMapper(_instance!);
      CustomerEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InjectDataBeforeAppStart';

  static CustomerEntity? _$customer(InjectDataBeforeAppStart v) => v.customer;
  static const Field<InjectDataBeforeAppStart, CustomerEntity> _f$customer =
      Field('customer', _$customer);

  @override
  final MappableFields<InjectDataBeforeAppStart> fields = const {
    #customer: _f$customer,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'inject_data_before_app_start';
  @override
  late final ClassMapperBase superMapper =
      AppStateEventMapper.ensureInitialized();

  static InjectDataBeforeAppStart _instantiate(DecodingData data) {
    return InjectDataBeforeAppStart(customer: data.dec(_f$customer));
  }

  @override
  final Function instantiate = _instantiate;

  static InjectDataBeforeAppStart fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InjectDataBeforeAppStart>(map);
  }

  static InjectDataBeforeAppStart fromJsonString(String json) {
    return ensureInitialized().decodeJson<InjectDataBeforeAppStart>(json);
  }
}

mixin InjectDataBeforeAppStartMappable {
  String toJsonString() {
    return InjectDataBeforeAppStartMapper.ensureInitialized()
        .encodeJson<InjectDataBeforeAppStart>(this as InjectDataBeforeAppStart);
  }

  Map<String, dynamic> toJson() {
    return InjectDataBeforeAppStartMapper.ensureInitialized()
        .encodeMap<InjectDataBeforeAppStart>(this as InjectDataBeforeAppStart);
  }

  InjectDataBeforeAppStartCopyWith<
    InjectDataBeforeAppStart,
    InjectDataBeforeAppStart,
    InjectDataBeforeAppStart
  >
  get copyWith =>
      _InjectDataBeforeAppStartCopyWithImpl<
        InjectDataBeforeAppStart,
        InjectDataBeforeAppStart
      >(this as InjectDataBeforeAppStart, $identity, $identity);
  @override
  String toString() {
    return InjectDataBeforeAppStartMapper.ensureInitialized().stringifyValue(
      this as InjectDataBeforeAppStart,
    );
  }

  @override
  bool operator ==(Object other) {
    return InjectDataBeforeAppStartMapper.ensureInitialized().equalsValue(
      this as InjectDataBeforeAppStart,
      other,
    );
  }

  @override
  int get hashCode {
    return InjectDataBeforeAppStartMapper.ensureInitialized().hashValue(
      this as InjectDataBeforeAppStart,
    );
  }
}

extension InjectDataBeforeAppStartValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InjectDataBeforeAppStart, $Out> {
  InjectDataBeforeAppStartCopyWith<$R, InjectDataBeforeAppStart, $Out>
  get $asInjectDataBeforeAppStart => $base.as(
    (v, t, t2) => _InjectDataBeforeAppStartCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class InjectDataBeforeAppStartCopyWith<
  $R,
  $In extends InjectDataBeforeAppStart,
  $Out
>
    implements AppStateEventCopyWith<$R, $In, $Out> {
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer;
  @override
  $R call({CustomerEntity? customer});
  InjectDataBeforeAppStartCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _InjectDataBeforeAppStartCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InjectDataBeforeAppStart, $Out>
    implements
        InjectDataBeforeAppStartCopyWith<$R, InjectDataBeforeAppStart, $Out> {
  _InjectDataBeforeAppStartCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InjectDataBeforeAppStart> $mapper =
      InjectDataBeforeAppStartMapper.ensureInitialized();
  @override
  CustomerEntityCopyWith<$R, CustomerEntity, CustomerEntity>? get customer =>
      $value.customer?.copyWith.$chain((v) => call(customer: v));
  @override
  $R call({Object? customer = $none}) =>
      $apply(FieldCopyWithData({if (customer != $none) #customer: customer}));
  @override
  InjectDataBeforeAppStart $make(CopyWithData data) => InjectDataBeforeAppStart(
    customer: data.get(#customer, or: $value.customer),
  );

  @override
  InjectDataBeforeAppStartCopyWith<$R2, InjectDataBeforeAppStart, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InjectDataBeforeAppStartCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SyncLocalDataToAppStateMapper
    extends SubClassMapperBase<SyncLocalDataToAppState> {
  SyncLocalDataToAppStateMapper._();

  static SyncLocalDataToAppStateMapper? _instance;
  static SyncLocalDataToAppStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SyncLocalDataToAppStateMapper._(),
      );
      AppStateEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SyncLocalDataToAppState';

  static Function _$mapper(SyncLocalDataToAppState v) =>
      (v as dynamic).mapper as Function;
  static dynamic _arg$mapper(f) => f<AppStateData Function(AppStateData)>();
  static const Field<SyncLocalDataToAppState, Function> _f$mapper = Field(
    'mapper',
    _$mapper,
    arg: _arg$mapper,
  );
  static String? _$type(SyncLocalDataToAppState v) => v.type;
  static const Field<SyncLocalDataToAppState, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );

  @override
  final MappableFields<SyncLocalDataToAppState> fields = const {
    #mapper: _f$mapper,
    #type: _f$type,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'sync_local_data_to_app_state';
  @override
  late final ClassMapperBase superMapper =
      AppStateEventMapper.ensureInitialized();

  static SyncLocalDataToAppState _instantiate(DecodingData data) {
    return SyncLocalDataToAppState(
      data.dec(_f$mapper),
      type: data.dec(_f$type),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SyncLocalDataToAppState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SyncLocalDataToAppState>(map);
  }

  static SyncLocalDataToAppState fromJsonString(String json) {
    return ensureInitialized().decodeJson<SyncLocalDataToAppState>(json);
  }
}

mixin SyncLocalDataToAppStateMappable {
  String toJsonString() {
    return SyncLocalDataToAppStateMapper.ensureInitialized()
        .encodeJson<SyncLocalDataToAppState>(this as SyncLocalDataToAppState);
  }

  Map<String, dynamic> toJson() {
    return SyncLocalDataToAppStateMapper.ensureInitialized()
        .encodeMap<SyncLocalDataToAppState>(this as SyncLocalDataToAppState);
  }

  SyncLocalDataToAppStateCopyWith<
    SyncLocalDataToAppState,
    SyncLocalDataToAppState,
    SyncLocalDataToAppState
  >
  get copyWith =>
      _SyncLocalDataToAppStateCopyWithImpl<
        SyncLocalDataToAppState,
        SyncLocalDataToAppState
      >(this as SyncLocalDataToAppState, $identity, $identity);
  @override
  String toString() {
    return SyncLocalDataToAppStateMapper.ensureInitialized().stringifyValue(
      this as SyncLocalDataToAppState,
    );
  }

  @override
  bool operator ==(Object other) {
    return SyncLocalDataToAppStateMapper.ensureInitialized().equalsValue(
      this as SyncLocalDataToAppState,
      other,
    );
  }

  @override
  int get hashCode {
    return SyncLocalDataToAppStateMapper.ensureInitialized().hashValue(
      this as SyncLocalDataToAppState,
    );
  }
}

extension SyncLocalDataToAppStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SyncLocalDataToAppState, $Out> {
  SyncLocalDataToAppStateCopyWith<$R, SyncLocalDataToAppState, $Out>
  get $asSyncLocalDataToAppState => $base.as(
    (v, t, t2) => _SyncLocalDataToAppStateCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SyncLocalDataToAppStateCopyWith<
  $R,
  $In extends SyncLocalDataToAppState,
  $Out
>
    implements AppStateEventCopyWith<$R, $In, $Out> {
  @override
  $R call({AppStateData Function(AppStateData)? mapper, String? type});
  SyncLocalDataToAppStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SyncLocalDataToAppStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SyncLocalDataToAppState, $Out>
    implements
        SyncLocalDataToAppStateCopyWith<$R, SyncLocalDataToAppState, $Out> {
  _SyncLocalDataToAppStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SyncLocalDataToAppState> $mapper =
      SyncLocalDataToAppStateMapper.ensureInitialized();
  @override
  $R call({
    AppStateData Function(AppStateData)? mapper,
    Object? type = $none,
  }) => $apply(
    FieldCopyWithData({
      if (mapper != null) #mapper: mapper,
      if (type != $none) #type: type,
    }),
  );
  @override
  SyncLocalDataToAppState $make(CopyWithData data) => SyncLocalDataToAppState(
    data.get(#mapper, or: $value.mapper),
    type: data.get(#type, or: $value.type),
  );

  @override
  SyncLocalDataToAppStateCopyWith<$R2, SyncLocalDataToAppState, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SyncLocalDataToAppStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppStateStateMapper extends ClassMapperBase<AppStateState> {
  AppStateStateMapper._();

  static AppStateStateMapper? _instance;
  static AppStateStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateStateMapper._());
      AppStateInitialMapper.ensureInitialized();
      AppStateLoadedMapper.ensureInitialized();
      AppStateDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppStateState';

  static AppStateData _$data(AppStateState v) => v.data;
  static const Field<AppStateState, AppStateData> _f$data = Field(
    'data',
    _$data,
  );

  @override
  final MappableFields<AppStateState> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  static AppStateState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'AppStateState',
      'state',
      '${data.value['state']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppStateState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppStateState>(map);
  }

  static AppStateState fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppStateState>(json);
  }
}

mixin AppStateStateMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  AppStateStateCopyWith<AppStateState, AppStateState, AppStateState>
  get copyWith;
}

abstract class AppStateStateCopyWith<$R, $In extends AppStateState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AppStateStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class AppStateInitialMapper extends SubClassMapperBase<AppStateInitial> {
  AppStateInitialMapper._();

  static AppStateInitialMapper? _instance;
  static AppStateInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateInitialMapper._());
      AppStateStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AppStateInitial';

  static AppStateData _$data(AppStateInitial v) => v.data;
  static const Field<AppStateInitial, AppStateData> _f$data = Field(
    'data',
    _$data,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<AppStateInitial> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'state';
  @override
  final dynamic discriminatorValue = 'initial';
  @override
  late final ClassMapperBase superMapper =
      AppStateStateMapper.ensureInitialized();

  static AppStateInitial _instantiate(DecodingData data) {
    return AppStateInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static AppStateInitial fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppStateInitial>(map);
  }

  static AppStateInitial fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppStateInitial>(json);
  }
}

mixin AppStateInitialMappable {
  String toJsonString() {
    return AppStateInitialMapper.ensureInitialized()
        .encodeJson<AppStateInitial>(this as AppStateInitial);
  }

  Map<String, dynamic> toJson() {
    return AppStateInitialMapper.ensureInitialized().encodeMap<AppStateInitial>(
      this as AppStateInitial,
    );
  }

  AppStateInitialCopyWith<AppStateInitial, AppStateInitial, AppStateInitial>
  get copyWith =>
      _AppStateInitialCopyWithImpl<AppStateInitial, AppStateInitial>(
        this as AppStateInitial,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppStateInitialMapper.ensureInitialized().stringifyValue(
      this as AppStateInitial,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppStateInitialMapper.ensureInitialized().equalsValue(
      this as AppStateInitial,
      other,
    );
  }

  @override
  int get hashCode {
    return AppStateInitialMapper.ensureInitialized().hashValue(
      this as AppStateInitial,
    );
  }
}

extension AppStateInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppStateInitial, $Out> {
  AppStateInitialCopyWith<$R, AppStateInitial, $Out> get $asAppStateInitial =>
      $base.as((v, t, t2) => _AppStateInitialCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppStateInitialCopyWith<$R, $In extends AppStateInitial, $Out>
    implements AppStateStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AppStateInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppStateInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppStateInitial, $Out>
    implements AppStateInitialCopyWith<$R, AppStateInitial, $Out> {
  _AppStateInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppStateInitial> $mapper =
      AppStateInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AppStateInitial $make(CopyWithData data) => AppStateInitial();

  @override
  AppStateInitialCopyWith<$R2, AppStateInitial, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppStateInitialCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppStateLoadedMapper extends SubClassMapperBase<AppStateLoaded> {
  AppStateLoadedMapper._();

  static AppStateLoadedMapper? _instance;
  static AppStateLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateLoadedMapper._());
      AppStateStateMapper.ensureInitialized().addSubMapper(_instance!);
      AppStateDataMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppStateLoaded';

  static AppStateData _$data(AppStateLoaded v) => v.data;
  static const Field<AppStateLoaded, AppStateData> _f$data = Field(
    'data',
    _$data,
  );

  @override
  final MappableFields<AppStateLoaded> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'state';
  @override
  final dynamic discriminatorValue = 'loaded';
  @override
  late final ClassMapperBase superMapper =
      AppStateStateMapper.ensureInitialized();

  static AppStateLoaded _instantiate(DecodingData data) {
    return AppStateLoaded(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static AppStateLoaded fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppStateLoaded>(map);
  }

  static AppStateLoaded fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppStateLoaded>(json);
  }
}

mixin AppStateLoadedMappable {
  String toJsonString() {
    return AppStateLoadedMapper.ensureInitialized().encodeJson<AppStateLoaded>(
      this as AppStateLoaded,
    );
  }

  Map<String, dynamic> toJson() {
    return AppStateLoadedMapper.ensureInitialized().encodeMap<AppStateLoaded>(
      this as AppStateLoaded,
    );
  }

  AppStateLoadedCopyWith<AppStateLoaded, AppStateLoaded, AppStateLoaded>
  get copyWith => _AppStateLoadedCopyWithImpl<AppStateLoaded, AppStateLoaded>(
    this as AppStateLoaded,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return AppStateLoadedMapper.ensureInitialized().stringifyValue(
      this as AppStateLoaded,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppStateLoadedMapper.ensureInitialized().equalsValue(
      this as AppStateLoaded,
      other,
    );
  }

  @override
  int get hashCode {
    return AppStateLoadedMapper.ensureInitialized().hashValue(
      this as AppStateLoaded,
    );
  }
}

extension AppStateLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppStateLoaded, $Out> {
  AppStateLoadedCopyWith<$R, AppStateLoaded, $Out> get $asAppStateLoaded =>
      $base.as((v, t, t2) => _AppStateLoadedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppStateLoadedCopyWith<$R, $In extends AppStateLoaded, $Out>
    implements AppStateStateCopyWith<$R, $In, $Out> {
  @override
  AppStateDataCopyWith<$R, AppStateData, AppStateData> get data;
  @override
  $R call({AppStateData? data});
  AppStateLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppStateLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppStateLoaded, $Out>
    implements AppStateLoadedCopyWith<$R, AppStateLoaded, $Out> {
  _AppStateLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppStateLoaded> $mapper =
      AppStateLoadedMapper.ensureInitialized();
  @override
  AppStateDataCopyWith<$R, AppStateData, AppStateData> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({AppStateData? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  AppStateLoaded $make(CopyWithData data) =>
      AppStateLoaded(data.get(#data, or: $value.data));

  @override
  AppStateLoadedCopyWith<$R2, AppStateLoaded, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppStateLoadedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

