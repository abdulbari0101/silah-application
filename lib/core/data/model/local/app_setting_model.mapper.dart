// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_setting_model.dart';

class AppSettingModelMapper extends ClassMapperBase<AppSettingModel> {
  AppSettingModelMapper._();

  static AppSettingModelMapper? _instance;
  static AppSettingModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppSettingModelMapper._());
      AppThemeModeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppSettingModel';

  static AppThemeMode? _$appAppThemeMode(AppSettingModel v) =>
      v.appAppThemeMode;
  static const Field<AppSettingModel, AppThemeMode> _f$appAppThemeMode = Field(
    'appAppThemeMode',
    _$appAppThemeMode,
    opt: true,
  );
  static int? _$languageNumber(AppSettingModel v) => v.languageNumber;
  static const Field<AppSettingModel, int> _f$languageNumber = Field(
    'languageNumber',
    _$languageNumber,
    opt: true,
  );

  @override
  final MappableFields<AppSettingModel> fields = const {
    #appAppThemeMode: _f$appAppThemeMode,
    #languageNumber: _f$languageNumber,
  };
  @override
  final bool ignoreNull = true;

  static AppSettingModel _instantiate(DecodingData data) {
    return AppSettingModel(
      appAppThemeMode: data.dec(_f$appAppThemeMode),
      languageNumber: data.dec(_f$languageNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppSettingModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppSettingModel>(map);
  }

  static AppSettingModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AppSettingModel>(json);
  }
}

mixin AppSettingModelMappable {
  String toJsonString() {
    return AppSettingModelMapper.ensureInitialized()
        .encodeJson<AppSettingModel>(this as AppSettingModel);
  }

  Map<String, dynamic> toJson() {
    return AppSettingModelMapper.ensureInitialized().encodeMap<AppSettingModel>(
      this as AppSettingModel,
    );
  }

  AppSettingModelCopyWith<AppSettingModel, AppSettingModel, AppSettingModel>
  get copyWith =>
      _AppSettingModelCopyWithImpl<AppSettingModel, AppSettingModel>(
        this as AppSettingModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppSettingModelMapper.ensureInitialized().stringifyValue(
      this as AppSettingModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppSettingModelMapper.ensureInitialized().equalsValue(
      this as AppSettingModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AppSettingModelMapper.ensureInitialized().hashValue(
      this as AppSettingModel,
    );
  }
}

extension AppSettingModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppSettingModel, $Out> {
  AppSettingModelCopyWith<$R, AppSettingModel, $Out> get $asAppSettingModel =>
      $base.as((v, t, t2) => _AppSettingModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppSettingModelCopyWith<$R, $In extends AppSettingModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({AppThemeMode? appAppThemeMode, int? languageNumber});
  AppSettingModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AppSettingModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppSettingModel, $Out>
    implements AppSettingModelCopyWith<$R, AppSettingModel, $Out> {
  _AppSettingModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppSettingModel> $mapper =
      AppSettingModelMapper.ensureInitialized();
  @override
  $R call({Object? appAppThemeMode = $none, Object? languageNumber = $none}) =>
      $apply(
        FieldCopyWithData({
          if (appAppThemeMode != $none) #appAppThemeMode: appAppThemeMode,
          if (languageNumber != $none) #languageNumber: languageNumber,
        }),
      );
  @override
  AppSettingModel $make(CopyWithData data) => AppSettingModel(
    appAppThemeMode: data.get(#appAppThemeMode, or: $value.appAppThemeMode),
    languageNumber: data.get(#languageNumber, or: $value.languageNumber),
  );

  @override
  AppSettingModelCopyWith<$R2, AppSettingModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppSettingModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

