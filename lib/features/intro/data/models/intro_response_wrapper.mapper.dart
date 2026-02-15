// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'intro_response_wrapper.dart';

class IntroRespWrapperMapper extends ClassMapperBase<IntroRespWrapper> {
  IntroRespWrapperMapper._();

  static IntroRespWrapperMapper? _instance;
  static IntroRespWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntroRespWrapperMapper._());
      BaseRespWrapperMapper.ensureInitialized();
      IntroModelMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IntroRespWrapper';

  static List<IntroModel>? _$Intro(IntroRespWrapper v) => v.Intro;
  static const Field<IntroRespWrapper, List<IntroModel>> _f$Intro = Field(
    'Intro',
    _$Intro,
    opt: true,
  );
  static ResultModel? _$result(IntroRespWrapper v) => v.result;
  static const Field<IntroRespWrapper, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
    opt: true,
  );

  @override
  final MappableFields<IntroRespWrapper> fields = const {
    #Intro: _f$Intro,
    #result: _f$result,
  };
  @override
  final bool ignoreNull = true;

  static IntroRespWrapper _instantiate(DecodingData data) {
    return IntroRespWrapper(
      Intro: data.dec(_f$Intro),
      result: data.dec(_f$result),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static IntroRespWrapper fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntroRespWrapper>(map);
  }

  static IntroRespWrapper fromJsonString(String json) {
    return ensureInitialized().decodeJson<IntroRespWrapper>(json);
  }
}

mixin IntroRespWrapperMappable {
  String toJsonString() {
    return IntroRespWrapperMapper.ensureInitialized()
        .encodeJson<IntroRespWrapper>(this as IntroRespWrapper);
  }

  Map<String, dynamic> toJson() {
    return IntroRespWrapperMapper.ensureInitialized()
        .encodeMap<IntroRespWrapper>(this as IntroRespWrapper);
  }

  IntroRespWrapperCopyWith<IntroRespWrapper, IntroRespWrapper, IntroRespWrapper>
  get copyWith =>
      _IntroRespWrapperCopyWithImpl<IntroRespWrapper, IntroRespWrapper>(
        this as IntroRespWrapper,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IntroRespWrapperMapper.ensureInitialized().stringifyValue(
      this as IntroRespWrapper,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntroRespWrapperMapper.ensureInitialized().equalsValue(
      this as IntroRespWrapper,
      other,
    );
  }

  @override
  int get hashCode {
    return IntroRespWrapperMapper.ensureInitialized().hashValue(
      this as IntroRespWrapper,
    );
  }
}

extension IntroRespWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntroRespWrapper, $Out> {
  IntroRespWrapperCopyWith<$R, IntroRespWrapper, $Out>
  get $asIntroRespWrapper =>
      $base.as((v, t, t2) => _IntroRespWrapperCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IntroRespWrapperCopyWith<$R, $In extends IntroRespWrapper, $Out>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, IntroModel, IntroModelCopyWith<$R, IntroModel, IntroModel>>?
  get Intro;
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({List<IntroModel>? Intro, ResultModel? result});
  IntroRespWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _IntroRespWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntroRespWrapper, $Out>
    implements IntroRespWrapperCopyWith<$R, IntroRespWrapper, $Out> {
  _IntroRespWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntroRespWrapper> $mapper =
      IntroRespWrapperMapper.ensureInitialized();
  @override
  ListCopyWith<$R, IntroModel, IntroModelCopyWith<$R, IntroModel, IntroModel>>?
  get Intro => $value.Intro != null
      ? ListCopyWith(
          $value.Intro!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(Intro: v),
        )
      : null;
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? Intro = $none, Object? result = $none}) => $apply(
    FieldCopyWithData({
      if (Intro != $none) #Intro: Intro,
      if (result != $none) #result: result,
    }),
  );
  @override
  IntroRespWrapper $make(CopyWithData data) => IntroRespWrapper(
    Intro: data.get(#Intro, or: $value.Intro),
    result: data.get(#result, or: $value.result),
  );

  @override
  IntroRespWrapperCopyWith<$R2, IntroRespWrapper, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IntroRespWrapperCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

