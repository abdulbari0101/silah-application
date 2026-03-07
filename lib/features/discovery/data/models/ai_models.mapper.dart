// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'ai_models.dart';

class AiRecommendRequestModelMapper
    extends ClassMapperBase<AiRecommendRequestModel> {
  AiRecommendRequestModelMapper._();

  static AiRecommendRequestModelMapper? _instance;
  static AiRecommendRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AiRecommendRequestModelMapper._(),
      );
      AiRecommendFiltersModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AiRecommendRequestModel';

  static String _$caseText(AiRecommendRequestModel v) => v.caseText;
  static const Field<AiRecommendRequestModel, String> _f$caseText = Field(
    'caseText',
    _$caseText,
  );
  static AiRecommendFiltersModel? _$filters(AiRecommendRequestModel v) =>
      v.filters;
  static const Field<AiRecommendRequestModel, AiRecommendFiltersModel>
  _f$filters = Field('filters', _$filters, opt: true);

  @override
  final MappableFields<AiRecommendRequestModel> fields = const {
    #caseText: _f$caseText,
    #filters: _f$filters,
  };
  @override
  final bool ignoreNull = true;

  static AiRecommendRequestModel _instantiate(DecodingData data) {
    return AiRecommendRequestModel(
      caseText: data.dec(_f$caseText),
      filters: data.dec(_f$filters),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiRecommendRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiRecommendRequestModel>(map);
  }

  static AiRecommendRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiRecommendRequestModel>(json);
  }
}

mixin AiRecommendRequestModelMappable {
  String toJsonString() {
    return AiRecommendRequestModelMapper.ensureInitialized()
        .encodeJson<AiRecommendRequestModel>(this as AiRecommendRequestModel);
  }

  Map<String, dynamic> toJson() {
    return AiRecommendRequestModelMapper.ensureInitialized()
        .encodeMap<AiRecommendRequestModel>(this as AiRecommendRequestModel);
  }

  AiRecommendRequestModelCopyWith<
    AiRecommendRequestModel,
    AiRecommendRequestModel,
    AiRecommendRequestModel
  >
  get copyWith =>
      _AiRecommendRequestModelCopyWithImpl<
        AiRecommendRequestModel,
        AiRecommendRequestModel
      >(this as AiRecommendRequestModel, $identity, $identity);
  @override
  String toString() {
    return AiRecommendRequestModelMapper.ensureInitialized().stringifyValue(
      this as AiRecommendRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AiRecommendRequestModelMapper.ensureInitialized().equalsValue(
      this as AiRecommendRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AiRecommendRequestModelMapper.ensureInitialized().hashValue(
      this as AiRecommendRequestModel,
    );
  }
}

extension AiRecommendRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiRecommendRequestModel, $Out> {
  AiRecommendRequestModelCopyWith<$R, AiRecommendRequestModel, $Out>
  get $asAiRecommendRequestModel => $base.as(
    (v, t, t2) => _AiRecommendRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiRecommendRequestModelCopyWith<
  $R,
  $In extends AiRecommendRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  AiRecommendFiltersModelCopyWith<
    $R,
    AiRecommendFiltersModel,
    AiRecommendFiltersModel
  >?
  get filters;
  $R call({String? caseText, AiRecommendFiltersModel? filters});
  AiRecommendRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiRecommendRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiRecommendRequestModel, $Out>
    implements
        AiRecommendRequestModelCopyWith<$R, AiRecommendRequestModel, $Out> {
  _AiRecommendRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AiRecommendRequestModel> $mapper =
      AiRecommendRequestModelMapper.ensureInitialized();
  @override
  AiRecommendFiltersModelCopyWith<
    $R,
    AiRecommendFiltersModel,
    AiRecommendFiltersModel
  >?
  get filters => $value.filters?.copyWith.$chain((v) => call(filters: v));
  @override
  $R call({String? caseText, Object? filters = $none}) => $apply(
    FieldCopyWithData({
      if (caseText != null) #caseText: caseText,
      if (filters != $none) #filters: filters,
    }),
  );
  @override
  AiRecommendRequestModel $make(CopyWithData data) => AiRecommendRequestModel(
    caseText: data.get(#caseText, or: $value.caseText),
    filters: data.get(#filters, or: $value.filters),
  );

  @override
  AiRecommendRequestModelCopyWith<$R2, AiRecommendRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiRecommendRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AiRecommendFiltersModelMapper
    extends ClassMapperBase<AiRecommendFiltersModel> {
  AiRecommendFiltersModelMapper._();

  static AiRecommendFiltersModelMapper? _instance;
  static AiRecommendFiltersModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AiRecommendFiltersModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'AiRecommendFiltersModel';

  static String? _$city(AiRecommendFiltersModel v) => v.city;
  static const Field<AiRecommendFiltersModel, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$availability(AiRecommendFiltersModel v) => v.availability;
  static const Field<AiRecommendFiltersModel, String> _f$availability = Field(
    'availability',
    _$availability,
    opt: true,
  );

  @override
  final MappableFields<AiRecommendFiltersModel> fields = const {
    #city: _f$city,
    #availability: _f$availability,
  };
  @override
  final bool ignoreNull = true;

  static AiRecommendFiltersModel _instantiate(DecodingData data) {
    return AiRecommendFiltersModel(
      city: data.dec(_f$city),
      availability: data.dec(_f$availability),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiRecommendFiltersModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiRecommendFiltersModel>(map);
  }

  static AiRecommendFiltersModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiRecommendFiltersModel>(json);
  }
}

mixin AiRecommendFiltersModelMappable {
  String toJsonString() {
    return AiRecommendFiltersModelMapper.ensureInitialized()
        .encodeJson<AiRecommendFiltersModel>(this as AiRecommendFiltersModel);
  }

  Map<String, dynamic> toJson() {
    return AiRecommendFiltersModelMapper.ensureInitialized()
        .encodeMap<AiRecommendFiltersModel>(this as AiRecommendFiltersModel);
  }

  AiRecommendFiltersModelCopyWith<
    AiRecommendFiltersModel,
    AiRecommendFiltersModel,
    AiRecommendFiltersModel
  >
  get copyWith =>
      _AiRecommendFiltersModelCopyWithImpl<
        AiRecommendFiltersModel,
        AiRecommendFiltersModel
      >(this as AiRecommendFiltersModel, $identity, $identity);
  @override
  String toString() {
    return AiRecommendFiltersModelMapper.ensureInitialized().stringifyValue(
      this as AiRecommendFiltersModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AiRecommendFiltersModelMapper.ensureInitialized().equalsValue(
      this as AiRecommendFiltersModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AiRecommendFiltersModelMapper.ensureInitialized().hashValue(
      this as AiRecommendFiltersModel,
    );
  }
}

extension AiRecommendFiltersModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiRecommendFiltersModel, $Out> {
  AiRecommendFiltersModelCopyWith<$R, AiRecommendFiltersModel, $Out>
  get $asAiRecommendFiltersModel => $base.as(
    (v, t, t2) => _AiRecommendFiltersModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiRecommendFiltersModelCopyWith<
  $R,
  $In extends AiRecommendFiltersModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? city, String? availability});
  AiRecommendFiltersModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiRecommendFiltersModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiRecommendFiltersModel, $Out>
    implements
        AiRecommendFiltersModelCopyWith<$R, AiRecommendFiltersModel, $Out> {
  _AiRecommendFiltersModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AiRecommendFiltersModel> $mapper =
      AiRecommendFiltersModelMapper.ensureInitialized();
  @override
  $R call({Object? city = $none, Object? availability = $none}) => $apply(
    FieldCopyWithData({
      if (city != $none) #city: city,
      if (availability != $none) #availability: availability,
    }),
  );
  @override
  AiRecommendFiltersModel $make(CopyWithData data) => AiRecommendFiltersModel(
    city: data.get(#city, or: $value.city),
    availability: data.get(#availability, or: $value.availability),
  );

  @override
  AiRecommendFiltersModelCopyWith<$R2, AiRecommendFiltersModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiRecommendFiltersModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AiRecommendResponseModelMapper
    extends ClassMapperBase<AiRecommendResponseModel> {
  AiRecommendResponseModelMapper._();

  static AiRecommendResponseModelMapper? _instance;
  static AiRecommendResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = AiRecommendResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
      LegalSpecializationModelMapper.ensureInitialized();
      LawyerProfileEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AiRecommendResponseModel';

  static ResultModel? _$result(AiRecommendResponseModel v) => v.result;
  static const Field<AiRecommendResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static LegalSpecializationModel? _$specialization(
    AiRecommendResponseModel v,
  ) => v.specialization;
  static const Field<AiRecommendResponseModel, LegalSpecializationModel>
  _f$specialization = Field('specialization', _$specialization, opt: true);
  static String? _$specializationId(AiRecommendResponseModel v) =>
      v.specializationId;
  static const Field<AiRecommendResponseModel, String> _f$specializationId =
      Field('specializationId', _$specializationId, opt: true);
  static List<LawyerProfileEntity>? _$lawyers(AiRecommendResponseModel v) =>
      v.lawyers;
  static const Field<AiRecommendResponseModel, List<LawyerProfileEntity>>
  _f$lawyers = Field('lawyers', _$lawyers, opt: true);

  @override
  final MappableFields<AiRecommendResponseModel> fields = const {
    #result: _f$result,
    #specialization: _f$specialization,
    #specializationId: _f$specializationId,
    #lawyers: _f$lawyers,
  };
  @override
  final bool ignoreNull = true;

  static AiRecommendResponseModel _instantiate(DecodingData data) {
    return AiRecommendResponseModel(
      result: data.dec(_f$result),
      specialization: data.dec(_f$specialization),
      specializationId: data.dec(_f$specializationId),
      lawyers: data.dec(_f$lawyers),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AiRecommendResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AiRecommendResponseModel>(map);
  }

  static AiRecommendResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AiRecommendResponseModel>(json);
  }
}

mixin AiRecommendResponseModelMappable {
  String toJsonString() {
    return AiRecommendResponseModelMapper.ensureInitialized()
        .encodeJson<AiRecommendResponseModel>(this as AiRecommendResponseModel);
  }

  Map<String, dynamic> toJson() {
    return AiRecommendResponseModelMapper.ensureInitialized()
        .encodeMap<AiRecommendResponseModel>(this as AiRecommendResponseModel);
  }

  AiRecommendResponseModelCopyWith<
    AiRecommendResponseModel,
    AiRecommendResponseModel,
    AiRecommendResponseModel
  >
  get copyWith =>
      _AiRecommendResponseModelCopyWithImpl<
        AiRecommendResponseModel,
        AiRecommendResponseModel
      >(this as AiRecommendResponseModel, $identity, $identity);
  @override
  String toString() {
    return AiRecommendResponseModelMapper.ensureInitialized().stringifyValue(
      this as AiRecommendResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AiRecommendResponseModelMapper.ensureInitialized().equalsValue(
      this as AiRecommendResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AiRecommendResponseModelMapper.ensureInitialized().hashValue(
      this as AiRecommendResponseModel,
    );
  }
}

extension AiRecommendResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AiRecommendResponseModel, $Out> {
  AiRecommendResponseModelCopyWith<$R, AiRecommendResponseModel, $Out>
  get $asAiRecommendResponseModel => $base.as(
    (v, t, t2) => _AiRecommendResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AiRecommendResponseModelCopyWith<
  $R,
  $In extends AiRecommendResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  LegalSpecializationModelCopyWith<
    $R,
    LegalSpecializationModel,
    LegalSpecializationModel
  >?
  get specialization;
  ListCopyWith<
    $R,
    LawyerProfileEntity,
    LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>
  >?
  get lawyers;
  @override
  $R call({
    ResultModel? result,
    LegalSpecializationModel? specialization,
    String? specializationId,
    List<LawyerProfileEntity>? lawyers,
  });
  AiRecommendResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AiRecommendResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AiRecommendResponseModel, $Out>
    implements
        AiRecommendResponseModelCopyWith<$R, AiRecommendResponseModel, $Out> {
  _AiRecommendResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AiRecommendResponseModel> $mapper =
      AiRecommendResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  LegalSpecializationModelCopyWith<
    $R,
    LegalSpecializationModel,
    LegalSpecializationModel
  >?
  get specialization =>
      $value.specialization?.copyWith.$chain((v) => call(specialization: v));
  @override
  ListCopyWith<
    $R,
    LawyerProfileEntity,
    LawyerProfileEntityCopyWith<$R, LawyerProfileEntity, LawyerProfileEntity>
  >?
  get lawyers => $value.lawyers != null
      ? ListCopyWith(
          $value.lawyers!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(lawyers: v),
        )
      : null;
  @override
  $R call({
    Object? result = $none,
    Object? specialization = $none,
    Object? specializationId = $none,
    Object? lawyers = $none,
  }) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (specialization != $none) #specialization: specialization,
      if (specializationId != $none) #specializationId: specializationId,
      if (lawyers != $none) #lawyers: lawyers,
    }),
  );
  @override
  AiRecommendResponseModel $make(CopyWithData data) => AiRecommendResponseModel(
    result: data.get(#result, or: $value.result),
    specialization: data.get(#specialization, or: $value.specialization),
    specializationId: data.get(#specializationId, or: $value.specializationId),
    lawyers: data.get(#lawyers, or: $value.lawyers),
  );

  @override
  AiRecommendResponseModelCopyWith<$R2, AiRecommendResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AiRecommendResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

