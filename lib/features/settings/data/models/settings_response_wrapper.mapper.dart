// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'settings_response_wrapper.dart';

class SettingsRespWrapperMapper extends ClassMapperBase<SettingsRespWrapper> {
  SettingsRespWrapperMapper._();

  static SettingsRespWrapperMapper? _instance;
  static SettingsRespWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SettingsRespWrapperMapper._());
      BaseRespWrapperMapper.ensureInitialized();
      AppSettingModelMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SettingsRespWrapper';

  static List<AppSettingModel>? _$settings(SettingsRespWrapper v) => v.settings;
  static const Field<SettingsRespWrapper, List<AppSettingModel>> _f$settings =
      Field('settings', _$settings, key: r'Settings', opt: true);
  static ResultModel? _$result(SettingsRespWrapper v) => v.result;
  static const Field<SettingsRespWrapper, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
    opt: true,
  );

  @override
  final MappableFields<SettingsRespWrapper> fields = const {
    #settings: _f$settings,
    #result: _f$result,
  };
  @override
  final bool ignoreNull = true;

  static SettingsRespWrapper _instantiate(DecodingData data) {
    return SettingsRespWrapper(
      settings: data.dec(_f$settings),
      result: data.dec(_f$result),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SettingsRespWrapper fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SettingsRespWrapper>(map);
  }

  static SettingsRespWrapper fromJsonString(String json) {
    return ensureInitialized().decodeJson<SettingsRespWrapper>(json);
  }
}

mixin SettingsRespWrapperMappable {
  String toJsonString() {
    return SettingsRespWrapperMapper.ensureInitialized()
        .encodeJson<SettingsRespWrapper>(this as SettingsRespWrapper);
  }

  Map<String, dynamic> toJson() {
    return SettingsRespWrapperMapper.ensureInitialized()
        .encodeMap<SettingsRespWrapper>(this as SettingsRespWrapper);
  }

  SettingsRespWrapperCopyWith<
    SettingsRespWrapper,
    SettingsRespWrapper,
    SettingsRespWrapper
  >
  get copyWith =>
      _SettingsRespWrapperCopyWithImpl<
        SettingsRespWrapper,
        SettingsRespWrapper
      >(this as SettingsRespWrapper, $identity, $identity);
  @override
  String toString() {
    return SettingsRespWrapperMapper.ensureInitialized().stringifyValue(
      this as SettingsRespWrapper,
    );
  }

  @override
  bool operator ==(Object other) {
    return SettingsRespWrapperMapper.ensureInitialized().equalsValue(
      this as SettingsRespWrapper,
      other,
    );
  }

  @override
  int get hashCode {
    return SettingsRespWrapperMapper.ensureInitialized().hashValue(
      this as SettingsRespWrapper,
    );
  }
}

extension SettingsRespWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SettingsRespWrapper, $Out> {
  SettingsRespWrapperCopyWith<$R, SettingsRespWrapper, $Out>
  get $asSettingsRespWrapper => $base.as(
    (v, t, t2) => _SettingsRespWrapperCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SettingsRespWrapperCopyWith<
  $R,
  $In extends SettingsRespWrapper,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    AppSettingModel,
    AppSettingModelCopyWith<$R, AppSettingModel, AppSettingModel>
  >?
  get settings;
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({List<AppSettingModel>? settings, ResultModel? result});
  SettingsRespWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SettingsRespWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SettingsRespWrapper, $Out>
    implements SettingsRespWrapperCopyWith<$R, SettingsRespWrapper, $Out> {
  _SettingsRespWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SettingsRespWrapper> $mapper =
      SettingsRespWrapperMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    AppSettingModel,
    AppSettingModelCopyWith<$R, AppSettingModel, AppSettingModel>
  >?
  get settings => $value.settings != null
      ? ListCopyWith(
          $value.settings!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(settings: v),
        )
      : null;
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? settings = $none, Object? result = $none}) => $apply(
    FieldCopyWithData({
      if (settings != $none) #settings: settings,
      if (result != $none) #result: result,
    }),
  );
  @override
  SettingsRespWrapper $make(CopyWithData data) => SettingsRespWrapper(
    settings: data.get(#settings, or: $value.settings),
    result: data.get(#result, or: $value.result),
  );

  @override
  SettingsRespWrapperCopyWith<$R2, SettingsRespWrapper, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SettingsRespWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

