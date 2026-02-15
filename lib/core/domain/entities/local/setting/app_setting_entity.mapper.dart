// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_setting_entity.dart';

class AppSettingEntityMapper extends ClassMapperBase<AppSettingEntity> {
  AppSettingEntityMapper._();

  static AppSettingEntityMapper? _instance;
  static AppSettingEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingEntityMapper._());
      AppThemeModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingEntity';

  static AppThemeMode _$appAppThemeMode(AppSettingEntity v) =>
      v.appAppThemeMode;
  static const Field<AppSettingEntity, AppThemeMode> _f$appAppThemeMode = Field(
    'appAppThemeMode',
    _$appAppThemeMode,
    opt: true,
    def: AppThemeMode.system,
  );
  static AppLanguage _$language(AppSettingEntity v) => v.language;
  static const Field<AppSettingEntity, AppLanguage> _f$language = Field(
    'language',
    _$language,
    opt: true,
    def: AppLanguage.fallbackLanguage,
  );

  @override
  final MappableFields<AppSettingEntity> fields = const {
    #appAppThemeMode: _f$appAppThemeMode,
    #language: _f$language,
  };
  @override
  final bool ignoreNull = true;

  static AppSettingEntity _instantiate(DecodingData data) {
    return AppSettingEntity(
      appAppThemeMode: data.dec(_f$appAppThemeMode),
      language: data.dec(_f$language),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingEntity>(map);
  }

  static AppSettingEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingEntity>(json);
  }
}

mixin AppSettingEntityMappable {
  String toJsonString() {
    return AppSettingEntityMapper.ensureInitialized()
        .encodeJson<AppSettingEntity>(this as AppSettingEntity);
  }

  Map<String, dynamic> toJson() {
    return AppSettingEntityMapper.ensureInitialized()
        .encodeMap<AppSettingEntity>(this as AppSettingEntity);
  }

  AppSettingEntityCopyWith<AppSettingEntity, AppSettingEntity, AppSettingEntity>
  get copyWith =>
      _AppSettingEntityCopyWithImpl<AppSettingEntity, AppSettingEntity>(
        this as AppSettingEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingEntityMapper.ensureInitialized().stringifyValue(
      this as AppSettingEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingEntityMapper.ensureInitialized().equalsValue(
      this as AppSettingEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingEntityMapper.ensureInitialized().hashValue(
      this as AppSettingEntity,
    );
  }
}

extension AppSettingEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingEntity, $Out> {
  AppSettingEntityCopyWith<$R, AppSettingEntity, $Out>
  get $asAppSettingEntity =>
      $base.as((v, t, t2) => _AppSettingEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppSettingEntityCopyWith<$R, $In extends AppSettingEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({AppThemeMode? appAppThemeMode, AppLanguage? language});
  AppSettingEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingEntity, $Out>
    implements AppSettingEntityCopyWith<$R, AppSettingEntity, $Out> {
  _AppSettingEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingEntity> $mapper =
      AppSettingEntityMapper.ensureInitialized();
  @override
  $R call({AppThemeMode? appAppThemeMode, AppLanguage? language}) => $apply(
    FieldCopyWithData({
      if (appAppThemeMode != null) #appAppThemeMode: appAppThemeMode,
      if (language != null) #language: language,
    }),
  );
  @override
  AppSettingEntity $make(CopyWithData data) => AppSettingEntity(
    appAppThemeMode: data.get(#appAppThemeMode, or: $value.appAppThemeMode),
    language: data.get(#language, or: $value.language),
  );

  @override
  AppSettingEntityCopyWith<$R2, AppSettingEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

