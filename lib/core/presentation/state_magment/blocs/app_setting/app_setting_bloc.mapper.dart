// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_setting_bloc.dart';

class AppSettingEventMapper extends ClassMapperBase<AppSettingEvent> {
  AppSettingEventMapper._();

  static AppSettingEventMapper? _instance;
  static AppSettingEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingEventMapper._());
      InjectAppSettingEventMapper.ensureInitialized();
      GetAppSettingEventMapper.ensureInitialized();
      ChangeThemeEventMapper.ensureInitialized();
      ChangeLanguageEventMapper.ensureInitialized();
      ChangeLocalEventMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingEvent';

  @override
  final MappableFields<AppSettingEvent> fields = const {};
  @override
  final bool ignoreNull = true;

  static AppSettingEvent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'AppSettingEvent',
      'event',
      '${data.value['event']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingEvent>(map);
  }

  static AppSettingEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingEvent>(json);
  }
}

mixin AppSettingEventMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  AppSettingEventCopyWith<AppSettingEvent, AppSettingEvent, AppSettingEvent>
  get copyWith;
}

abstract class AppSettingEventCopyWith<$R, $In extends AppSettingEvent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AppSettingEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class InjectAppSettingEventMapper
    extends SubClassMapperBase<InjectAppSettingEvent> {
  InjectAppSettingEventMapper._();

  static InjectAppSettingEventMapper? _instance;
  static InjectAppSettingEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InjectAppSettingEventMapper._());
      AppSettingEventMapper.ensureInitialized().addSubMapper(_instance!);
      AppSettingEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InjectAppSettingEvent';

  static AppSettingEntity _$setting(InjectAppSettingEvent v) => v.setting;
  static const Field<InjectAppSettingEvent, AppSettingEntity> _f$setting =
      Field('setting', _$setting);

  @override
  final MappableFields<InjectAppSettingEvent> fields = const {
    #setting: _f$setting,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'inject';
  @override
  late final ClassMapperBase superMapper =
      AppSettingEventMapper.ensureInitialized();

  static InjectAppSettingEvent _instantiate(DecodingData data) {
    return InjectAppSettingEvent(setting: data.dec(_f$setting));
  }

  @override
  final Function instantiate = _instantiate;

  static InjectAppSettingEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InjectAppSettingEvent>(map);
  }

  static InjectAppSettingEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<InjectAppSettingEvent>(json);
  }
}

mixin InjectAppSettingEventMappable {
  String toJsonString() {
    return InjectAppSettingEventMapper.ensureInitialized()
        .encodeJson<InjectAppSettingEvent>(this as InjectAppSettingEvent);
  }

  Map<String, dynamic> toJson() {
    return InjectAppSettingEventMapper.ensureInitialized()
        .encodeMap<InjectAppSettingEvent>(this as InjectAppSettingEvent);
  }

  InjectAppSettingEventCopyWith<
    InjectAppSettingEvent,
    InjectAppSettingEvent,
    InjectAppSettingEvent
  >
  get copyWith =>
      _InjectAppSettingEventCopyWithImpl<
        InjectAppSettingEvent,
        InjectAppSettingEvent
      >(this as InjectAppSettingEvent, $identity, $identity);
  @override
  String toString() {
    return InjectAppSettingEventMapper.ensureInitialized().stringifyValue(
      this as InjectAppSettingEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return InjectAppSettingEventMapper.ensureInitialized().equalsValue(
      this as InjectAppSettingEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return InjectAppSettingEventMapper.ensureInitialized().hashValue(
      this as InjectAppSettingEvent,
    );
  }
}

extension InjectAppSettingEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InjectAppSettingEvent, $Out> {
  InjectAppSettingEventCopyWith<$R, InjectAppSettingEvent, $Out>
  get $asInjectAppSettingEvent => $base.as(
    (v, t, t2) => _InjectAppSettingEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class InjectAppSettingEventCopyWith<
  $R,
  $In extends InjectAppSettingEvent,
  $Out
>
    implements AppSettingEventCopyWith<$R, $In, $Out> {
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get setting;
  @override
  $R call({AppSettingEntity? setting});
  InjectAppSettingEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _InjectAppSettingEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InjectAppSettingEvent, $Out>
    implements InjectAppSettingEventCopyWith<$R, InjectAppSettingEvent, $Out> {
  _InjectAppSettingEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InjectAppSettingEvent> $mapper =
      InjectAppSettingEventMapper.ensureInitialized();
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity>
  get setting => $value.setting.copyWith.$chain((v) => call(setting: v));
  @override
  $R call({AppSettingEntity? setting}) =>
      $apply(FieldCopyWithData({if (setting != null) #setting: setting}));
  @override
  InjectAppSettingEvent $make(CopyWithData data) =>
      InjectAppSettingEvent(setting: data.get(#setting, or: $value.setting));

  @override
  InjectAppSettingEventCopyWith<$R2, InjectAppSettingEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InjectAppSettingEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GetAppSettingEventMapper extends SubClassMapperBase<GetAppSettingEvent> {
  GetAppSettingEventMapper._();

  static GetAppSettingEventMapper? _instance;
  static GetAppSettingEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GetAppSettingEventMapper._());
      AppSettingEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'GetAppSettingEvent';

  @override
  final MappableFields<GetAppSettingEvent> fields = const {};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'get';
  @override
  late final ClassMapperBase superMapper =
      AppSettingEventMapper.ensureInitialized();

  static GetAppSettingEvent _instantiate(DecodingData data) {
    return GetAppSettingEvent();
  }

  @override
  final Function instantiate = _instantiate;

  static GetAppSettingEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GetAppSettingEvent>(map);
  }

  static GetAppSettingEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<GetAppSettingEvent>(json);
  }
}

mixin GetAppSettingEventMappable {
  String toJsonString() {
    return GetAppSettingEventMapper.ensureInitialized()
        .encodeJson<GetAppSettingEvent>(this as GetAppSettingEvent);
  }

  Map<String, dynamic> toJson() {
    return GetAppSettingEventMapper.ensureInitialized()
        .encodeMap<GetAppSettingEvent>(this as GetAppSettingEvent);
  }

  GetAppSettingEventCopyWith<
    GetAppSettingEvent,
    GetAppSettingEvent,
    GetAppSettingEvent
  >
  get copyWith =>
      _GetAppSettingEventCopyWithImpl<GetAppSettingEvent, GetAppSettingEvent>(
        this as GetAppSettingEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GetAppSettingEventMapper.ensureInitialized().stringifyValue(
      this as GetAppSettingEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return GetAppSettingEventMapper.ensureInitialized().equalsValue(
      this as GetAppSettingEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return GetAppSettingEventMapper.ensureInitialized().hashValue(
      this as GetAppSettingEvent,
    );
  }
}

extension GetAppSettingEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GetAppSettingEvent, $Out> {
  GetAppSettingEventCopyWith<$R, GetAppSettingEvent, $Out>
  get $asGetAppSettingEvent => $base.as(
    (v, t, t2) => _GetAppSettingEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class GetAppSettingEventCopyWith<
  $R,
  $In extends GetAppSettingEvent,
  $Out
>
    implements AppSettingEventCopyWith<$R, $In, $Out> {
  @override
  $R call();
  GetAppSettingEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GetAppSettingEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GetAppSettingEvent, $Out>
    implements GetAppSettingEventCopyWith<$R, GetAppSettingEvent, $Out> {
  _GetAppSettingEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GetAppSettingEvent> $mapper =
      GetAppSettingEventMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  GetAppSettingEvent $make(CopyWithData data) => GetAppSettingEvent();

  @override
  GetAppSettingEventCopyWith<$R2, GetAppSettingEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GetAppSettingEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChangeThemeEventMapper extends SubClassMapperBase<ChangeThemeEvent> {
  ChangeThemeEventMapper._();

  static ChangeThemeEventMapper? _instance;
  static ChangeThemeEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeThemeEventMapper._());
      AppSettingEventMapper.ensureInitialized().addSubMapper(_instance!);
      AppThemeModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeThemeEvent';

  static AppThemeMode? _$appAppThemeMode(ChangeThemeEvent v) =>
      v.appAppThemeMode;
  static const Field<ChangeThemeEvent, AppThemeMode> _f$appAppThemeMode = Field(
    'appAppThemeMode',
    _$appAppThemeMode,
    opt: true,
  );
  static String _$fromWhere(ChangeThemeEvent v) => v.fromWhere;
  static const Field<ChangeThemeEvent, String> _f$fromWhere = Field(
    'fromWhere',
    _$fromWhere,
  );

  @override
  final MappableFields<ChangeThemeEvent> fields = const {
    #appAppThemeMode: _f$appAppThemeMode,
    #fromWhere: _f$fromWhere,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'update_theme';
  @override
  late final ClassMapperBase superMapper =
      AppSettingEventMapper.ensureInitialized();

  static ChangeThemeEvent _instantiate(DecodingData data) {
    return ChangeThemeEvent(
      appAppThemeMode: data.dec(_f$appAppThemeMode),
      fromWhere: data.dec(_f$fromWhere),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeThemeEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeThemeEvent>(map);
  }

  static ChangeThemeEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangeThemeEvent>(json);
  }
}

mixin ChangeThemeEventMappable {
  String toJsonString() {
    return ChangeThemeEventMapper.ensureInitialized()
        .encodeJson<ChangeThemeEvent>(this as ChangeThemeEvent);
  }

  Map<String, dynamic> toJson() {
    return ChangeThemeEventMapper.ensureInitialized()
        .encodeMap<ChangeThemeEvent>(this as ChangeThemeEvent);
  }

  ChangeThemeEventCopyWith<ChangeThemeEvent, ChangeThemeEvent, ChangeThemeEvent>
  get copyWith =>
      _ChangeThemeEventCopyWithImpl<ChangeThemeEvent, ChangeThemeEvent>(
        this as ChangeThemeEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChangeThemeEventMapper.ensureInitialized().stringifyValue(
      this as ChangeThemeEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChangeThemeEventMapper.ensureInitialized().equalsValue(
      this as ChangeThemeEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ChangeThemeEventMapper.ensureInitialized().hashValue(
      this as ChangeThemeEvent,
    );
  }
}

extension ChangeThemeEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeThemeEvent, $Out> {
  ChangeThemeEventCopyWith<$R, ChangeThemeEvent, $Out>
  get $asChangeThemeEvent =>
      $base.as((v, t, t2) => _ChangeThemeEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChangeThemeEventCopyWith<$R, $In extends ChangeThemeEvent, $Out>
    implements AppSettingEventCopyWith<$R, $In, $Out> {
  @override
  $R call({AppThemeMode? appAppThemeMode, String? fromWhere});
  ChangeThemeEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChangeThemeEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeThemeEvent, $Out>
    implements ChangeThemeEventCopyWith<$R, ChangeThemeEvent, $Out> {
  _ChangeThemeEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeThemeEvent> $mapper =
      ChangeThemeEventMapper.ensureInitialized();
  @override
  $R call({Object? appAppThemeMode = $none, String? fromWhere}) => $apply(
    FieldCopyWithData({
      if (appAppThemeMode != $none) #appAppThemeMode: appAppThemeMode,
      if (fromWhere != null) #fromWhere: fromWhere,
    }),
  );
  @override
  ChangeThemeEvent $make(CopyWithData data) => ChangeThemeEvent(
    appAppThemeMode: data.get(#appAppThemeMode, or: $value.appAppThemeMode),
    fromWhere: data.get(#fromWhere, or: $value.fromWhere),
  );

  @override
  ChangeThemeEventCopyWith<$R2, ChangeThemeEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChangeThemeEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChangeLanguageEventMapper
    extends SubClassMapperBase<ChangeLanguageEvent> {
  ChangeLanguageEventMapper._();

  static ChangeLanguageEventMapper? _instance;
  static ChangeLanguageEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeLanguageEventMapper._());
      AppSettingEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeLanguageEvent';

  static AppLanguage _$language(ChangeLanguageEvent v) => v.language;
  static const Field<ChangeLanguageEvent, AppLanguage> _f$language = Field(
    'language',
    _$language,
  );
  static bool _$isRefresh(ChangeLanguageEvent v) => v.isRefresh;
  static const Field<ChangeLanguageEvent, bool> _f$isRefresh = Field(
    'isRefresh',
    _$isRefresh,
    opt: true,
    def: true,
  );
  static String _$fromWhere(ChangeLanguageEvent v) => v.fromWhere;
  static const Field<ChangeLanguageEvent, String> _f$fromWhere = Field(
    'fromWhere',
    _$fromWhere,
  );

  @override
  final MappableFields<ChangeLanguageEvent> fields = const {
    #language: _f$language,
    #isRefresh: _f$isRefresh,
    #fromWhere: _f$fromWhere,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'update_language';
  @override
  late final ClassMapperBase superMapper =
      AppSettingEventMapper.ensureInitialized();

  static ChangeLanguageEvent _instantiate(DecodingData data) {
    return ChangeLanguageEvent(
      language: data.dec(_f$language),
      isRefresh: data.dec(_f$isRefresh),
      fromWhere: data.dec(_f$fromWhere),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeLanguageEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeLanguageEvent>(map);
  }

  static ChangeLanguageEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangeLanguageEvent>(json);
  }
}

mixin ChangeLanguageEventMappable {
  String toJsonString() {
    return ChangeLanguageEventMapper.ensureInitialized()
        .encodeJson<ChangeLanguageEvent>(this as ChangeLanguageEvent);
  }

  Map<String, dynamic> toJson() {
    return ChangeLanguageEventMapper.ensureInitialized()
        .encodeMap<ChangeLanguageEvent>(this as ChangeLanguageEvent);
  }

  ChangeLanguageEventCopyWith<
    ChangeLanguageEvent,
    ChangeLanguageEvent,
    ChangeLanguageEvent
  >
  get copyWith =>
      _ChangeLanguageEventCopyWithImpl<
        ChangeLanguageEvent,
        ChangeLanguageEvent
      >(this as ChangeLanguageEvent, $identity, $identity);
  @override
  String toString() {
    return ChangeLanguageEventMapper.ensureInitialized().stringifyValue(
      this as ChangeLanguageEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChangeLanguageEventMapper.ensureInitialized().equalsValue(
      this as ChangeLanguageEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ChangeLanguageEventMapper.ensureInitialized().hashValue(
      this as ChangeLanguageEvent,
    );
  }
}

extension ChangeLanguageEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeLanguageEvent, $Out> {
  ChangeLanguageEventCopyWith<$R, ChangeLanguageEvent, $Out>
  get $asChangeLanguageEvent => $base.as(
    (v, t, t2) => _ChangeLanguageEventCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ChangeLanguageEventCopyWith<
  $R,
  $In extends ChangeLanguageEvent,
  $Out
>
    implements AppSettingEventCopyWith<$R, $In, $Out> {
  @override
  $R call({AppLanguage? language, bool? isRefresh, String? fromWhere});
  ChangeLanguageEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChangeLanguageEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeLanguageEvent, $Out>
    implements ChangeLanguageEventCopyWith<$R, ChangeLanguageEvent, $Out> {
  _ChangeLanguageEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeLanguageEvent> $mapper =
      ChangeLanguageEventMapper.ensureInitialized();
  @override
  $R call({AppLanguage? language, bool? isRefresh, String? fromWhere}) =>
      $apply(
        FieldCopyWithData({
          if (language != null) #language: language,
          if (isRefresh != null) #isRefresh: isRefresh,
          if (fromWhere != null) #fromWhere: fromWhere,
        }),
      );
  @override
  ChangeLanguageEvent $make(CopyWithData data) => ChangeLanguageEvent(
    language: data.get(#language, or: $value.language),
    isRefresh: data.get(#isRefresh, or: $value.isRefresh),
    fromWhere: data.get(#fromWhere, or: $value.fromWhere),
  );

  @override
  ChangeLanguageEventCopyWith<$R2, ChangeLanguageEvent, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChangeLanguageEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChangeLocalEventMapper extends SubClassMapperBase<ChangeLocalEvent> {
  ChangeLocalEventMapper._();

  static ChangeLocalEventMapper? _instance;
  static ChangeLocalEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeLocalEventMapper._());
      AppSettingEventMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeLocalEvent';

  static AppLanguage _$language(ChangeLocalEvent v) => v.language;
  static const Field<ChangeLocalEvent, AppLanguage> _f$language = Field(
    'language',
    _$language,
  );
  static bool _$isRefresh(ChangeLocalEvent v) => v.isRefresh;
  static const Field<ChangeLocalEvent, bool> _f$isRefresh = Field(
    'isRefresh',
    _$isRefresh,
    opt: true,
    def: true,
  );
  static String _$fromWhere(ChangeLocalEvent v) => v.fromWhere;
  static const Field<ChangeLocalEvent, String> _f$fromWhere = Field(
    'fromWhere',
    _$fromWhere,
  );

  @override
  final MappableFields<ChangeLocalEvent> fields = const {
    #language: _f$language,
    #isRefresh: _f$isRefresh,
    #fromWhere: _f$fromWhere,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'event';
  @override
  final dynamic discriminatorValue = 'update_local';
  @override
  late final ClassMapperBase superMapper =
      AppSettingEventMapper.ensureInitialized();

  static ChangeLocalEvent _instantiate(DecodingData data) {
    return ChangeLocalEvent(
      language: data.dec(_f$language),
      isRefresh: data.dec(_f$isRefresh),
      fromWhere: data.dec(_f$fromWhere),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeLocalEvent fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeLocalEvent>(map);
  }

  static ChangeLocalEvent fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChangeLocalEvent>(json);
  }
}

mixin ChangeLocalEventMappable {
  String toJsonString() {
    return ChangeLocalEventMapper.ensureInitialized()
        .encodeJson<ChangeLocalEvent>(this as ChangeLocalEvent);
  }

  Map<String, dynamic> toJson() {
    return ChangeLocalEventMapper.ensureInitialized()
        .encodeMap<ChangeLocalEvent>(this as ChangeLocalEvent);
  }

  ChangeLocalEventCopyWith<ChangeLocalEvent, ChangeLocalEvent, ChangeLocalEvent>
  get copyWith =>
      _ChangeLocalEventCopyWithImpl<ChangeLocalEvent, ChangeLocalEvent>(
        this as ChangeLocalEvent,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChangeLocalEventMapper.ensureInitialized().stringifyValue(
      this as ChangeLocalEvent,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChangeLocalEventMapper.ensureInitialized().equalsValue(
      this as ChangeLocalEvent,
      other,
    );
  }

  @override
  int get hashCode {
    return ChangeLocalEventMapper.ensureInitialized().hashValue(
      this as ChangeLocalEvent,
    );
  }
}

extension ChangeLocalEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeLocalEvent, $Out> {
  ChangeLocalEventCopyWith<$R, ChangeLocalEvent, $Out>
  get $asChangeLocalEvent =>
      $base.as((v, t, t2) => _ChangeLocalEventCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChangeLocalEventCopyWith<$R, $In extends ChangeLocalEvent, $Out>
    implements AppSettingEventCopyWith<$R, $In, $Out> {
  @override
  $R call({AppLanguage? language, bool? isRefresh, String? fromWhere});
  ChangeLocalEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChangeLocalEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeLocalEvent, $Out>
    implements ChangeLocalEventCopyWith<$R, ChangeLocalEvent, $Out> {
  _ChangeLocalEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeLocalEvent> $mapper =
      ChangeLocalEventMapper.ensureInitialized();
  @override
  $R call({AppLanguage? language, bool? isRefresh, String? fromWhere}) =>
      $apply(
        FieldCopyWithData({
          if (language != null) #language: language,
          if (isRefresh != null) #isRefresh: isRefresh,
          if (fromWhere != null) #fromWhere: fromWhere,
        }),
      );
  @override
  ChangeLocalEvent $make(CopyWithData data) => ChangeLocalEvent(
    language: data.get(#language, or: $value.language),
    isRefresh: data.get(#isRefresh, or: $value.isRefresh),
    fromWhere: data.get(#fromWhere, or: $value.fromWhere),
  );

  @override
  ChangeLocalEventCopyWith<$R2, ChangeLocalEvent, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChangeLocalEventCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppSettingStateMapper extends ClassMapperBase<AppSettingState> {
  AppSettingStateMapper._();

  static AppSettingStateMapper? _instance;
  static AppSettingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingStateMapper._());
      AppSettingInitialMapper.ensureInitialized();
      AppSettingLoadingMapper.ensureInitialized();
      AppSettingErrorMapper.ensureInitialized();
      AppSettingLoadedMapper.ensureInitialized();
      AppSettingEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingState';

  static AppSettingEntity _$data(AppSettingState v) => v.data;
  static const Field<AppSettingState, AppSettingEntity> _f$data = Field(
    'data',
    _$data,
  );

  @override
  final MappableFields<AppSettingState> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  static AppSettingState _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'AppSettingState',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingState fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingState>(map);
  }

  static AppSettingState fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingState>(json);
  }
}

mixin AppSettingStateMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  AppSettingStateCopyWith<AppSettingState, AppSettingState, AppSettingState>
  get copyWith;
}

abstract class AppSettingStateCopyWith<$R, $In extends AppSettingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  AppSettingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class AppSettingInitialMapper extends SubClassMapperBase<AppSettingInitial> {
  AppSettingInitialMapper._();

  static AppSettingInitialMapper? _instance;
  static AppSettingInitialMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingInitialMapper._());
      AppSettingStateMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingInitial';

  static AppSettingEntity _$data(AppSettingInitial v) => v.data;
  static const Field<AppSettingInitial, AppSettingEntity> _f$data = Field(
    'data',
    _$data,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<AppSettingInitial> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'initial';
  @override
  late final ClassMapperBase superMapper =
      AppSettingStateMapper.ensureInitialized();

  static AppSettingInitial _instantiate(DecodingData data) {
    return AppSettingInitial();
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingInitial fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingInitial>(map);
  }

  static AppSettingInitial fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingInitial>(json);
  }
}

mixin AppSettingInitialMappable {
  String toJsonString() {
    return AppSettingInitialMapper.ensureInitialized()
        .encodeJson<AppSettingInitial>(this as AppSettingInitial);
  }

  Map<String, dynamic> toJson() {
    return AppSettingInitialMapper.ensureInitialized()
        .encodeMap<AppSettingInitial>(this as AppSettingInitial);
  }

  AppSettingInitialCopyWith<
    AppSettingInitial,
    AppSettingInitial,
    AppSettingInitial
  >
  get copyWith =>
      _AppSettingInitialCopyWithImpl<AppSettingInitial, AppSettingInitial>(
        this as AppSettingInitial,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingInitialMapper.ensureInitialized().stringifyValue(
      this as AppSettingInitial,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingInitialMapper.ensureInitialized().equalsValue(
      this as AppSettingInitial,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingInitialMapper.ensureInitialized().hashValue(
      this as AppSettingInitial,
    );
  }
}

extension AppSettingInitialValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingInitial, $Out> {
  AppSettingInitialCopyWith<$R, AppSettingInitial, $Out>
  get $asAppSettingInitial => $base.as(
    (v, t, t2) => _AppSettingInitialCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AppSettingInitialCopyWith<
  $R,
  $In extends AppSettingInitial,
  $Out
>
    implements AppSettingStateCopyWith<$R, $In, $Out> {
  @override
  $R call();
  AppSettingInitialCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingInitialCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingInitial, $Out>
    implements AppSettingInitialCopyWith<$R, AppSettingInitial, $Out> {
  _AppSettingInitialCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingInitial> $mapper =
      AppSettingInitialMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  AppSettingInitial $make(CopyWithData data) => AppSettingInitial();

  @override
  AppSettingInitialCopyWith<$R2, AppSettingInitial, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingInitialCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppSettingLoadingMapper extends SubClassMapperBase<AppSettingLoading> {
  AppSettingLoadingMapper._();

  static AppSettingLoadingMapper? _instance;
  static AppSettingLoadingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingLoadingMapper._());
      AppSettingStateMapper.ensureInitialized().addSubMapper(_instance!);
      AppSettingEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingLoading';

  static AppSettingEntity _$data(AppSettingLoading v) => v.data;
  static const Field<AppSettingLoading, AppSettingEntity> _f$data = Field(
    'data',
    _$data,
    key: r'previous',
  );

  @override
  final MappableFields<AppSettingLoading> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'loading';
  @override
  late final ClassMapperBase superMapper =
      AppSettingStateMapper.ensureInitialized();

  static AppSettingLoading _instantiate(DecodingData data) {
    return AppSettingLoading(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingLoading fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingLoading>(map);
  }

  static AppSettingLoading fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingLoading>(json);
  }
}

mixin AppSettingLoadingMappable {
  String toJsonString() {
    return AppSettingLoadingMapper.ensureInitialized()
        .encodeJson<AppSettingLoading>(this as AppSettingLoading);
  }

  Map<String, dynamic> toJson() {
    return AppSettingLoadingMapper.ensureInitialized()
        .encodeMap<AppSettingLoading>(this as AppSettingLoading);
  }

  AppSettingLoadingCopyWith<
    AppSettingLoading,
    AppSettingLoading,
    AppSettingLoading
  >
  get copyWith =>
      _AppSettingLoadingCopyWithImpl<AppSettingLoading, AppSettingLoading>(
        this as AppSettingLoading,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingLoadingMapper.ensureInitialized().stringifyValue(
      this as AppSettingLoading,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingLoadingMapper.ensureInitialized().equalsValue(
      this as AppSettingLoading,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingLoadingMapper.ensureInitialized().hashValue(
      this as AppSettingLoading,
    );
  }
}

extension AppSettingLoadingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingLoading, $Out> {
  AppSettingLoadingCopyWith<$R, AppSettingLoading, $Out>
  get $asAppSettingLoading => $base.as(
    (v, t, t2) => _AppSettingLoadingCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AppSettingLoadingCopyWith<
  $R,
  $In extends AppSettingLoading,
  $Out
>
    implements AppSettingStateCopyWith<$R, $In, $Out> {
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data;
  @override
  $R call({AppSettingEntity? data});
  AppSettingLoadingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingLoadingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingLoading, $Out>
    implements AppSettingLoadingCopyWith<$R, AppSettingLoading, $Out> {
  _AppSettingLoadingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingLoading> $mapper =
      AppSettingLoadingMapper.ensureInitialized();
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({AppSettingEntity? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  AppSettingLoading $make(CopyWithData data) =>
      AppSettingLoading(data.get(#data, or: $value.data));

  @override
  AppSettingLoadingCopyWith<$R2, AppSettingLoading, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingLoadingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppSettingErrorMapper extends SubClassMapperBase<AppSettingError> {
  AppSettingErrorMapper._();

  static AppSettingErrorMapper? _instance;
  static AppSettingErrorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingErrorMapper._());
      AppSettingStateMapper.ensureInitialized().addSubMapper(_instance!);
      AppSettingEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingError';

  static String _$message(AppSettingError v) => v.message;
  static const Field<AppSettingError, String> _f$message = Field(
    'message',
    _$message,
  );
  static AppSettingEntity _$data(AppSettingError v) => v.data;
  static const Field<AppSettingError, AppSettingEntity> _f$data = Field(
    'data',
    _$data,
    key: r'previous',
  );

  @override
  final MappableFields<AppSettingError> fields = const {
    #message: _f$message,
    #data: _f$data,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'error';
  @override
  late final ClassMapperBase superMapper =
      AppSettingStateMapper.ensureInitialized();

  static AppSettingError _instantiate(DecodingData data) {
    return AppSettingError(
      message: data.dec(_f$message),
      previous: data.dec(_f$data),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingError fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingError>(map);
  }

  static AppSettingError fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingError>(json);
  }
}

mixin AppSettingErrorMappable {
  String toJsonString() {
    return AppSettingErrorMapper.ensureInitialized()
        .encodeJson<AppSettingError>(this as AppSettingError);
  }

  Map<String, dynamic> toJson() {
    return AppSettingErrorMapper.ensureInitialized().encodeMap<AppSettingError>(
      this as AppSettingError,
    );
  }

  AppSettingErrorCopyWith<AppSettingError, AppSettingError, AppSettingError>
  get copyWith =>
      _AppSettingErrorCopyWithImpl<AppSettingError, AppSettingError>(
        this as AppSettingError,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingErrorMapper.ensureInitialized().stringifyValue(
      this as AppSettingError,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingErrorMapper.ensureInitialized().equalsValue(
      this as AppSettingError,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingErrorMapper.ensureInitialized().hashValue(
      this as AppSettingError,
    );
  }
}

extension AppSettingErrorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingError, $Out> {
  AppSettingErrorCopyWith<$R, AppSettingError, $Out> get $asAppSettingError =>
      $base.as((v, t, t2) => _AppSettingErrorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppSettingErrorCopyWith<$R, $In extends AppSettingError, $Out>
    implements AppSettingStateCopyWith<$R, $In, $Out> {
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data;
  @override
  $R call({String? message, AppSettingEntity? data});
  AppSettingErrorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingErrorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingError, $Out>
    implements AppSettingErrorCopyWith<$R, AppSettingError, $Out> {
  _AppSettingErrorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingError> $mapper =
      AppSettingErrorMapper.ensureInitialized();
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({String? message, AppSettingEntity? data}) => $apply(
    FieldCopyWithData({
      if (message != null) #message: message,
      if (data != null) #data: data,
    }),
  );
  @override
  AppSettingError $make(CopyWithData data) => AppSettingError(
    message: data.get(#message, or: $value.message),
    previous: data.get(#data, or: $value.data),
  );

  @override
  AppSettingErrorCopyWith<$R2, AppSettingError, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingErrorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AppSettingLoadedMapper extends SubClassMapperBase<AppSettingLoaded> {
  AppSettingLoadedMapper._();

  static AppSettingLoadedMapper? _instance;
  static AppSettingLoadedMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingLoadedMapper._());
      AppSettingStateMapper.ensureInitialized().addSubMapper(_instance!);
      AppSettingEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingLoaded';

  static AppSettingEntity _$data(AppSettingLoaded v) => v.data;
  static const Field<AppSettingLoaded, AppSettingEntity> _f$data = Field(
    'data',
    _$data,
    key: r'setting',
  );

  @override
  final MappableFields<AppSettingLoaded> fields = const {#data: _f$data};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'loaded';
  @override
  late final ClassMapperBase superMapper =
      AppSettingStateMapper.ensureInitialized();

  static AppSettingLoaded _instantiate(DecodingData data) {
    return AppSettingLoaded(data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingLoaded fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingLoaded>(map);
  }

  static AppSettingLoaded fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingLoaded>(json);
  }
}

mixin AppSettingLoadedMappable {
  String toJsonString() {
    return AppSettingLoadedMapper.ensureInitialized()
        .encodeJson<AppSettingLoaded>(this as AppSettingLoaded);
  }

  Map<String, dynamic> toJson() {
    return AppSettingLoadedMapper.ensureInitialized()
        .encodeMap<AppSettingLoaded>(this as AppSettingLoaded);
  }

  AppSettingLoadedCopyWith<AppSettingLoaded, AppSettingLoaded, AppSettingLoaded>
  get copyWith =>
      _AppSettingLoadedCopyWithImpl<AppSettingLoaded, AppSettingLoaded>(
        this as AppSettingLoaded,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingLoadedMapper.ensureInitialized().stringifyValue(
      this as AppSettingLoaded,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingLoadedMapper.ensureInitialized().equalsValue(
      this as AppSettingLoaded,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingLoadedMapper.ensureInitialized().hashValue(
      this as AppSettingLoaded,
    );
  }
}

extension AppSettingLoadedValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingLoaded, $Out> {
  AppSettingLoadedCopyWith<$R, AppSettingLoaded, $Out>
  get $asAppSettingLoaded =>
      $base.as((v, t, t2) => _AppSettingLoadedCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppSettingLoadedCopyWith<$R, $In extends AppSettingLoaded, $Out>
    implements AppSettingStateCopyWith<$R, $In, $Out> {
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data;
  @override
  $R call({AppSettingEntity? data});
  AppSettingLoadedCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingLoadedCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingLoaded, $Out>
    implements AppSettingLoadedCopyWith<$R, AppSettingLoaded, $Out> {
  _AppSettingLoadedCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingLoaded> $mapper =
      AppSettingLoadedMapper.ensureInitialized();
  @override
  AppSettingEntityCopyWith<$R, AppSettingEntity, AppSettingEntity> get data =>
      $value.data.copyWith.$chain((v) => call(data: v));
  @override
  $R call({AppSettingEntity? data}) =>
      $apply(FieldCopyWithData({if (data != null) #data: data}));
  @override
  AppSettingLoaded $make(CopyWithData data) =>
      AppSettingLoaded(data.get(#data, or: $value.data));

  @override
  AppSettingLoadedCopyWith<$R2, AppSettingLoaded, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingLoadedCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

