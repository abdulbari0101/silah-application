// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'training_models.dart';

class TrainingApplicationCreateRequestModelMapper
    extends ClassMapperBase<TrainingApplicationCreateRequestModel> {
  TrainingApplicationCreateRequestModelMapper._();

  static TrainingApplicationCreateRequestModelMapper? _instance;
  static TrainingApplicationCreateRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationCreateRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingApplicationCreateRequestModel';

  static String _$opportunityId(TrainingApplicationCreateRequestModel v) =>
      v.opportunityId;
  static const Field<TrainingApplicationCreateRequestModel, String>
  _f$opportunityId = Field('opportunityId', _$opportunityId);
  static String _$traineeUid(TrainingApplicationCreateRequestModel v) =>
      v.traineeUid;
  static const Field<TrainingApplicationCreateRequestModel, String>
  _f$traineeUid = Field('traineeUid', _$traineeUid);
  static String _$cvUrl(TrainingApplicationCreateRequestModel v) => v.cvUrl;
  static const Field<TrainingApplicationCreateRequestModel, String> _f$cvUrl =
      Field('cvUrl', _$cvUrl);
  static String? _$fullName(TrainingApplicationCreateRequestModel v) =>
      v.fullName;
  static const Field<TrainingApplicationCreateRequestModel, String>
  _f$fullName = Field('fullName', _$fullName, opt: true);
  static String? _$university(TrainingApplicationCreateRequestModel v) =>
      v.university;
  static const Field<TrainingApplicationCreateRequestModel, String>
  _f$university = Field('university', _$university, opt: true);
  static String? _$faculty(TrainingApplicationCreateRequestModel v) =>
      v.faculty;
  static const Field<TrainingApplicationCreateRequestModel, String> _f$faculty =
      Field('faculty', _$faculty, opt: true);
  static String? _$cityId(TrainingApplicationCreateRequestModel v) => v.cityId;
  static const Field<TrainingApplicationCreateRequestModel, String> _f$cityId =
      Field('cityId', _$cityId, opt: true);
  static String? _$city(TrainingApplicationCreateRequestModel v) => v.city;
  static const Field<TrainingApplicationCreateRequestModel, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$countryId(TrainingApplicationCreateRequestModel v) =>
      v.countryId;
  static const Field<TrainingApplicationCreateRequestModel, String>
  _f$countryId = Field('countryId', _$countryId, opt: true);
  static int? _$graduationYear(TrainingApplicationCreateRequestModel v) =>
      v.graduationYear;
  static const Field<TrainingApplicationCreateRequestModel, int>
  _f$graduationYear = Field('graduationYear', _$graduationYear, opt: true);

  @override
  final MappableFields<TrainingApplicationCreateRequestModel> fields = const {
    #opportunityId: _f$opportunityId,
    #traineeUid: _f$traineeUid,
    #cvUrl: _f$cvUrl,
    #fullName: _f$fullName,
    #university: _f$university,
    #faculty: _f$faculty,
    #cityId: _f$cityId,
    #city: _f$city,
    #countryId: _f$countryId,
    #graduationYear: _f$graduationYear,
  };
  @override
  final bool ignoreNull = true;

  static TrainingApplicationCreateRequestModel _instantiate(DecodingData data) {
    return TrainingApplicationCreateRequestModel(
      opportunityId: data.dec(_f$opportunityId),
      traineeUid: data.dec(_f$traineeUid),
      cvUrl: data.dec(_f$cvUrl),
      fullName: data.dec(_f$fullName),
      university: data.dec(_f$university),
      faculty: data.dec(_f$faculty),
      cityId: data.dec(_f$cityId),
      city: data.dec(_f$city),
      countryId: data.dec(_f$countryId),
      graduationYear: data.dec(_f$graduationYear),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingApplicationCreateRequestModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<TrainingApplicationCreateRequestModel>(
      map,
    );
  }

  static TrainingApplicationCreateRequestModel fromJsonString(String json) {
    return ensureInitialized()
        .decodeJson<TrainingApplicationCreateRequestModel>(json);
  }
}

mixin TrainingApplicationCreateRequestModelMappable {
  String toJsonString() {
    return TrainingApplicationCreateRequestModelMapper.ensureInitialized()
        .encodeJson<TrainingApplicationCreateRequestModel>(
          this as TrainingApplicationCreateRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingApplicationCreateRequestModelMapper.ensureInitialized()
        .encodeMap<TrainingApplicationCreateRequestModel>(
          this as TrainingApplicationCreateRequestModel,
        );
  }

  TrainingApplicationCreateRequestModelCopyWith<
    TrainingApplicationCreateRequestModel,
    TrainingApplicationCreateRequestModel,
    TrainingApplicationCreateRequestModel
  >
  get copyWith =>
      _TrainingApplicationCreateRequestModelCopyWithImpl<
        TrainingApplicationCreateRequestModel,
        TrainingApplicationCreateRequestModel
      >(this as TrainingApplicationCreateRequestModel, $identity, $identity);
  @override
  String toString() {
    return TrainingApplicationCreateRequestModelMapper.ensureInitialized()
        .stringifyValue(this as TrainingApplicationCreateRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return TrainingApplicationCreateRequestModelMapper.ensureInitialized()
        .equalsValue(this as TrainingApplicationCreateRequestModel, other);
  }

  @override
  int get hashCode {
    return TrainingApplicationCreateRequestModelMapper.ensureInitialized()
        .hashValue(this as TrainingApplicationCreateRequestModel);
  }
}

extension TrainingApplicationCreateRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingApplicationCreateRequestModel, $Out> {
  TrainingApplicationCreateRequestModelCopyWith<
    $R,
    TrainingApplicationCreateRequestModel,
    $Out
  >
  get $asTrainingApplicationCreateRequestModel => $base.as(
    (v, t, t2) =>
        _TrainingApplicationCreateRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TrainingApplicationCreateRequestModelCopyWith<
  $R,
  $In extends TrainingApplicationCreateRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? opportunityId,
    String? traineeUid,
    String? cvUrl,
    String? fullName,
    String? university,
    String? faculty,
    String? cityId,
    String? city,
    String? countryId,
    int? graduationYear,
  });
  TrainingApplicationCreateRequestModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrainingApplicationCreateRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrainingApplicationCreateRequestModel, $Out>
    implements
        TrainingApplicationCreateRequestModelCopyWith<
          $R,
          TrainingApplicationCreateRequestModel,
          $Out
        > {
  _TrainingApplicationCreateRequestModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TrainingApplicationCreateRequestModel> $mapper =
      TrainingApplicationCreateRequestModelMapper.ensureInitialized();
  @override
  $R call({
    String? opportunityId,
    String? traineeUid,
    String? cvUrl,
    Object? fullName = $none,
    Object? university = $none,
    Object? faculty = $none,
    Object? cityId = $none,
    Object? city = $none,
    Object? countryId = $none,
    Object? graduationYear = $none,
  }) => $apply(
    FieldCopyWithData({
      if (opportunityId != null) #opportunityId: opportunityId,
      if (traineeUid != null) #traineeUid: traineeUid,
      if (cvUrl != null) #cvUrl: cvUrl,
      if (fullName != $none) #fullName: fullName,
      if (university != $none) #university: university,
      if (faculty != $none) #faculty: faculty,
      if (cityId != $none) #cityId: cityId,
      if (city != $none) #city: city,
      if (countryId != $none) #countryId: countryId,
      if (graduationYear != $none) #graduationYear: graduationYear,
    }),
  );
  @override
  TrainingApplicationCreateRequestModel $make(CopyWithData data) =>
      TrainingApplicationCreateRequestModel(
        opportunityId: data.get(#opportunityId, or: $value.opportunityId),
        traineeUid: data.get(#traineeUid, or: $value.traineeUid),
        cvUrl: data.get(#cvUrl, or: $value.cvUrl),
        fullName: data.get(#fullName, or: $value.fullName),
        university: data.get(#university, or: $value.university),
        faculty: data.get(#faculty, or: $value.faculty),
        cityId: data.get(#cityId, or: $value.cityId),
        city: data.get(#city, or: $value.city),
        countryId: data.get(#countryId, or: $value.countryId),
        graduationYear: data.get(#graduationYear, or: $value.graduationYear),
      );

  @override
  TrainingApplicationCreateRequestModelCopyWith<
    $R2,
    TrainingApplicationCreateRequestModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingApplicationCreateRequestModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class TrainingApplicationCreateResponseModelMapper
    extends ClassMapperBase<TrainingApplicationCreateResponseModel> {
  TrainingApplicationCreateResponseModelMapper._();

  static TrainingApplicationCreateResponseModelMapper? _instance;
  static TrainingApplicationCreateResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationCreateResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingApplicationCreateResponseModel';

  static ResultModel? _$result(TrainingApplicationCreateResponseModel v) =>
      v.result;
  static const Field<TrainingApplicationCreateResponseModel, ResultModel>
  _f$result = Field('result', _$result, key: r'Result');
  static String? _$applicationId(TrainingApplicationCreateResponseModel v) =>
      v.applicationId;
  static const Field<TrainingApplicationCreateResponseModel, String>
  _f$applicationId = Field('applicationId', _$applicationId, opt: true);

  @override
  final MappableFields<TrainingApplicationCreateResponseModel> fields = const {
    #result: _f$result,
    #applicationId: _f$applicationId,
  };
  @override
  final bool ignoreNull = true;

  static TrainingApplicationCreateResponseModel _instantiate(
    DecodingData data,
  ) {
    return TrainingApplicationCreateResponseModel(
      result: data.dec(_f$result),
      applicationId: data.dec(_f$applicationId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingApplicationCreateResponseModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized()
        .decodeMap<TrainingApplicationCreateResponseModel>(map);
  }

  static TrainingApplicationCreateResponseModel fromJsonString(String json) {
    return ensureInitialized()
        .decodeJson<TrainingApplicationCreateResponseModel>(json);
  }
}

mixin TrainingApplicationCreateResponseModelMappable {
  String toJsonString() {
    return TrainingApplicationCreateResponseModelMapper.ensureInitialized()
        .encodeJson<TrainingApplicationCreateResponseModel>(
          this as TrainingApplicationCreateResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingApplicationCreateResponseModelMapper.ensureInitialized()
        .encodeMap<TrainingApplicationCreateResponseModel>(
          this as TrainingApplicationCreateResponseModel,
        );
  }

  TrainingApplicationCreateResponseModelCopyWith<
    TrainingApplicationCreateResponseModel,
    TrainingApplicationCreateResponseModel,
    TrainingApplicationCreateResponseModel
  >
  get copyWith =>
      _TrainingApplicationCreateResponseModelCopyWithImpl<
        TrainingApplicationCreateResponseModel,
        TrainingApplicationCreateResponseModel
      >(this as TrainingApplicationCreateResponseModel, $identity, $identity);
  @override
  String toString() {
    return TrainingApplicationCreateResponseModelMapper.ensureInitialized()
        .stringifyValue(this as TrainingApplicationCreateResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return TrainingApplicationCreateResponseModelMapper.ensureInitialized()
        .equalsValue(this as TrainingApplicationCreateResponseModel, other);
  }

  @override
  int get hashCode {
    return TrainingApplicationCreateResponseModelMapper.ensureInitialized()
        .hashValue(this as TrainingApplicationCreateResponseModel);
  }
}

extension TrainingApplicationCreateResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingApplicationCreateResponseModel, $Out> {
  TrainingApplicationCreateResponseModelCopyWith<
    $R,
    TrainingApplicationCreateResponseModel,
    $Out
  >
  get $asTrainingApplicationCreateResponseModel => $base.as(
    (v, t, t2) =>
        _TrainingApplicationCreateResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TrainingApplicationCreateResponseModelCopyWith<
  $R,
  $In extends TrainingApplicationCreateResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? applicationId});
  TrainingApplicationCreateResponseModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrainingApplicationCreateResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrainingApplicationCreateResponseModel, $Out>
    implements
        TrainingApplicationCreateResponseModelCopyWith<
          $R,
          TrainingApplicationCreateResponseModel,
          $Out
        > {
  _TrainingApplicationCreateResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TrainingApplicationCreateResponseModel> $mapper =
      TrainingApplicationCreateResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? applicationId = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (applicationId != $none) #applicationId: applicationId,
    }),
  );
  @override
  TrainingApplicationCreateResponseModel $make(CopyWithData data) =>
      TrainingApplicationCreateResponseModel(
        result: data.get(#result, or: $value.result),
        applicationId: data.get(#applicationId, or: $value.applicationId),
      );

  @override
  TrainingApplicationCreateResponseModelCopyWith<
    $R2,
    TrainingApplicationCreateResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingApplicationCreateResponseModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class TrainingApplicationStatusUpdateRequestModelMapper
    extends ClassMapperBase<TrainingApplicationStatusUpdateRequestModel> {
  TrainingApplicationStatusUpdateRequestModelMapper._();

  static TrainingApplicationStatusUpdateRequestModelMapper? _instance;
  static TrainingApplicationStatusUpdateRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationStatusUpdateRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingApplicationStatusUpdateRequestModel';

  static String _$status(TrainingApplicationStatusUpdateRequestModel v) =>
      v.status;
  static const Field<TrainingApplicationStatusUpdateRequestModel, String>
  _f$status = Field('status', _$status);

  @override
  final MappableFields<TrainingApplicationStatusUpdateRequestModel> fields =
      const {#status: _f$status};
  @override
  final bool ignoreNull = true;

  static TrainingApplicationStatusUpdateRequestModel _instantiate(
    DecodingData data,
  ) {
    return TrainingApplicationStatusUpdateRequestModel(
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingApplicationStatusUpdateRequestModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized()
        .decodeMap<TrainingApplicationStatusUpdateRequestModel>(map);
  }

  static TrainingApplicationStatusUpdateRequestModel fromJsonString(
    String json,
  ) {
    return ensureInitialized()
        .decodeJson<TrainingApplicationStatusUpdateRequestModel>(json);
  }
}

mixin TrainingApplicationStatusUpdateRequestModelMappable {
  String toJsonString() {
    return TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized()
        .encodeJson<TrainingApplicationStatusUpdateRequestModel>(
          this as TrainingApplicationStatusUpdateRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized()
        .encodeMap<TrainingApplicationStatusUpdateRequestModel>(
          this as TrainingApplicationStatusUpdateRequestModel,
        );
  }

  TrainingApplicationStatusUpdateRequestModelCopyWith<
    TrainingApplicationStatusUpdateRequestModel,
    TrainingApplicationStatusUpdateRequestModel,
    TrainingApplicationStatusUpdateRequestModel
  >
  get copyWith =>
      _TrainingApplicationStatusUpdateRequestModelCopyWithImpl<
        TrainingApplicationStatusUpdateRequestModel,
        TrainingApplicationStatusUpdateRequestModel
      >(
        this as TrainingApplicationStatusUpdateRequestModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized()
        .stringifyValue(this as TrainingApplicationStatusUpdateRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized()
        .equalsValue(
          this as TrainingApplicationStatusUpdateRequestModel,
          other,
        );
  }

  @override
  int get hashCode {
    return TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized()
        .hashValue(this as TrainingApplicationStatusUpdateRequestModel);
  }
}

extension TrainingApplicationStatusUpdateRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingApplicationStatusUpdateRequestModel, $Out> {
  TrainingApplicationStatusUpdateRequestModelCopyWith<
    $R,
    TrainingApplicationStatusUpdateRequestModel,
    $Out
  >
  get $asTrainingApplicationStatusUpdateRequestModel => $base.as(
    (v, t, t2) =>
        _TrainingApplicationStatusUpdateRequestModelCopyWithImpl<$R, $Out>(
          v,
          t,
          t2,
        ),
  );
}

abstract class TrainingApplicationStatusUpdateRequestModelCopyWith<
  $R,
  $In extends TrainingApplicationStatusUpdateRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status});
  TrainingApplicationStatusUpdateRequestModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrainingApplicationStatusUpdateRequestModelCopyWithImpl<$R, $Out>
    extends
        ClassCopyWithBase<$R, TrainingApplicationStatusUpdateRequestModel, $Out>
    implements
        TrainingApplicationStatusUpdateRequestModelCopyWith<
          $R,
          TrainingApplicationStatusUpdateRequestModel,
          $Out
        > {
  _TrainingApplicationStatusUpdateRequestModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TrainingApplicationStatusUpdateRequestModel>
  $mapper =
      TrainingApplicationStatusUpdateRequestModelMapper.ensureInitialized();
  @override
  $R call({String? status}) =>
      $apply(FieldCopyWithData({if (status != null) #status: status}));
  @override
  TrainingApplicationStatusUpdateRequestModel $make(CopyWithData data) =>
      TrainingApplicationStatusUpdateRequestModel(
        status: data.get(#status, or: $value.status),
      );

  @override
  TrainingApplicationStatusUpdateRequestModelCopyWith<
    $R2,
    TrainingApplicationStatusUpdateRequestModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingApplicationStatusUpdateRequestModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class TrainingApplicationStatusUpdateResponseModelMapper
    extends ClassMapperBase<TrainingApplicationStatusUpdateResponseModel> {
  TrainingApplicationStatusUpdateResponseModelMapper._();

  static TrainingApplicationStatusUpdateResponseModelMapper? _instance;
  static TrainingApplicationStatusUpdateResponseModelMapper
  ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationStatusUpdateResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingApplicationStatusUpdateResponseModel';

  static ResultModel? _$result(
    TrainingApplicationStatusUpdateResponseModel v,
  ) => v.result;
  static const Field<TrainingApplicationStatusUpdateResponseModel, ResultModel>
  _f$result = Field('result', _$result, key: r'Result');
  static String? _$status(TrainingApplicationStatusUpdateResponseModel v) =>
      v.status;
  static const Field<TrainingApplicationStatusUpdateResponseModel, String>
  _f$status = Field('status', _$status, opt: true);

  @override
  final MappableFields<TrainingApplicationStatusUpdateResponseModel> fields =
      const {#result: _f$result, #status: _f$status};
  @override
  final bool ignoreNull = true;

  static TrainingApplicationStatusUpdateResponseModel _instantiate(
    DecodingData data,
  ) {
    return TrainingApplicationStatusUpdateResponseModel(
      result: data.dec(_f$result),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingApplicationStatusUpdateResponseModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized()
        .decodeMap<TrainingApplicationStatusUpdateResponseModel>(map);
  }

  static TrainingApplicationStatusUpdateResponseModel fromJsonString(
    String json,
  ) {
    return ensureInitialized()
        .decodeJson<TrainingApplicationStatusUpdateResponseModel>(json);
  }
}

mixin TrainingApplicationStatusUpdateResponseModelMappable {
  String toJsonString() {
    return TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized()
        .encodeJson<TrainingApplicationStatusUpdateResponseModel>(
          this as TrainingApplicationStatusUpdateResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized()
        .encodeMap<TrainingApplicationStatusUpdateResponseModel>(
          this as TrainingApplicationStatusUpdateResponseModel,
        );
  }

  TrainingApplicationStatusUpdateResponseModelCopyWith<
    TrainingApplicationStatusUpdateResponseModel,
    TrainingApplicationStatusUpdateResponseModel,
    TrainingApplicationStatusUpdateResponseModel
  >
  get copyWith =>
      _TrainingApplicationStatusUpdateResponseModelCopyWithImpl<
        TrainingApplicationStatusUpdateResponseModel,
        TrainingApplicationStatusUpdateResponseModel
      >(
        this as TrainingApplicationStatusUpdateResponseModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized()
        .stringifyValue(this as TrainingApplicationStatusUpdateResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized()
        .equalsValue(
          this as TrainingApplicationStatusUpdateResponseModel,
          other,
        );
  }

  @override
  int get hashCode {
    return TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized()
        .hashValue(this as TrainingApplicationStatusUpdateResponseModel);
  }
}

extension TrainingApplicationStatusUpdateResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingApplicationStatusUpdateResponseModel, $Out> {
  TrainingApplicationStatusUpdateResponseModelCopyWith<
    $R,
    TrainingApplicationStatusUpdateResponseModel,
    $Out
  >
  get $asTrainingApplicationStatusUpdateResponseModel => $base.as(
    (v, t, t2) =>
        _TrainingApplicationStatusUpdateResponseModelCopyWithImpl<$R, $Out>(
          v,
          t,
          t2,
        ),
  );
}

abstract class TrainingApplicationStatusUpdateResponseModelCopyWith<
  $R,
  $In extends TrainingApplicationStatusUpdateResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? status});
  TrainingApplicationStatusUpdateResponseModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TrainingApplicationStatusUpdateResponseModelCopyWithImpl<$R, $Out>
    extends
        ClassCopyWithBase<
          $R,
          TrainingApplicationStatusUpdateResponseModel,
          $Out
        >
    implements
        TrainingApplicationStatusUpdateResponseModelCopyWith<
          $R,
          TrainingApplicationStatusUpdateResponseModel,
          $Out
        > {
  _TrainingApplicationStatusUpdateResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TrainingApplicationStatusUpdateResponseModel>
  $mapper =
      TrainingApplicationStatusUpdateResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? status = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (status != $none) #status: status,
    }),
  );
  @override
  TrainingApplicationStatusUpdateResponseModel $make(CopyWithData data) =>
      TrainingApplicationStatusUpdateResponseModel(
        result: data.get(#result, or: $value.result),
        status: data.get(#status, or: $value.status),
      );

  @override
  TrainingApplicationStatusUpdateResponseModelCopyWith<
    $R2,
    TrainingApplicationStatusUpdateResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingApplicationStatusUpdateResponseModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

