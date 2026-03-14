// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'consultation_models.dart';

class ConsultationCreateRequestModelMapper
    extends ClassMapperBase<ConsultationCreateRequestModel> {
  ConsultationCreateRequestModelMapper._();

  static ConsultationCreateRequestModelMapper? _instance;
  static ConsultationCreateRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationCreateRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'ConsultationCreateRequestModel';

  static String _$clientUid(ConsultationCreateRequestModel v) => v.clientUid;
  static const Field<ConsultationCreateRequestModel, String> _f$clientUid =
      Field('clientUid', _$clientUid);
  static String _$lawyerUid(ConsultationCreateRequestModel v) => v.lawyerUid;
  static const Field<ConsultationCreateRequestModel, String> _f$lawyerUid =
      Field('lawyerUid', _$lawyerUid);
  static String _$caseText(ConsultationCreateRequestModel v) => v.caseText;
  static const Field<ConsultationCreateRequestModel, String> _f$caseText =
      Field('caseText', _$caseText);
  static String? _$specializationId(ConsultationCreateRequestModel v) =>
      v.specializationId;
  static const Field<ConsultationCreateRequestModel, String>
  _f$specializationId = Field(
    'specializationId',
    _$specializationId,
    opt: true,
  );
  static String? _$specialization(ConsultationCreateRequestModel v) =>
      v.specialization;
  static const Field<ConsultationCreateRequestModel, String> _f$specialization =
      Field('specialization', _$specialization, opt: true);

  @override
  final MappableFields<ConsultationCreateRequestModel> fields = const {
    #clientUid: _f$clientUid,
    #lawyerUid: _f$lawyerUid,
    #caseText: _f$caseText,
    #specializationId: _f$specializationId,
    #specialization: _f$specialization,
  };
  @override
  final bool ignoreNull = true;

  static ConsultationCreateRequestModel _instantiate(DecodingData data) {
    return ConsultationCreateRequestModel(
      clientUid: data.dec(_f$clientUid),
      lawyerUid: data.dec(_f$lawyerUid),
      caseText: data.dec(_f$caseText),
      specializationId: data.dec(_f$specializationId),
      specialization: data.dec(_f$specialization),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsultationCreateRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConsultationCreateRequestModel>(map);
  }

  static ConsultationCreateRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ConsultationCreateRequestModel>(json);
  }
}

mixin ConsultationCreateRequestModelMappable {
  String toJsonString() {
    return ConsultationCreateRequestModelMapper.ensureInitialized()
        .encodeJson<ConsultationCreateRequestModel>(
          this as ConsultationCreateRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return ConsultationCreateRequestModelMapper.ensureInitialized()
        .encodeMap<ConsultationCreateRequestModel>(
          this as ConsultationCreateRequestModel,
        );
  }

  ConsultationCreateRequestModelCopyWith<
    ConsultationCreateRequestModel,
    ConsultationCreateRequestModel,
    ConsultationCreateRequestModel
  >
  get copyWith =>
      _ConsultationCreateRequestModelCopyWithImpl<
        ConsultationCreateRequestModel,
        ConsultationCreateRequestModel
      >(this as ConsultationCreateRequestModel, $identity, $identity);
  @override
  String toString() {
    return ConsultationCreateRequestModelMapper.ensureInitialized()
        .stringifyValue(this as ConsultationCreateRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return ConsultationCreateRequestModelMapper.ensureInitialized().equalsValue(
      this as ConsultationCreateRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ConsultationCreateRequestModelMapper.ensureInitialized().hashValue(
      this as ConsultationCreateRequestModel,
    );
  }
}

extension ConsultationCreateRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsultationCreateRequestModel, $Out> {
  ConsultationCreateRequestModelCopyWith<
    $R,
    ConsultationCreateRequestModel,
    $Out
  >
  get $asConsultationCreateRequestModel => $base.as(
    (v, t, t2) =>
        _ConsultationCreateRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsultationCreateRequestModelCopyWith<
  $R,
  $In extends ConsultationCreateRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? clientUid,
    String? lawyerUid,
    String? caseText,
    String? specializationId,
    String? specialization,
  });
  ConsultationCreateRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ConsultationCreateRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsultationCreateRequestModel, $Out>
    implements
        ConsultationCreateRequestModelCopyWith<
          $R,
          ConsultationCreateRequestModel,
          $Out
        > {
  _ConsultationCreateRequestModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<ConsultationCreateRequestModel> $mapper =
      ConsultationCreateRequestModelMapper.ensureInitialized();
  @override
  $R call({
    String? clientUid,
    String? lawyerUid,
    String? caseText,
    Object? specializationId = $none,
    Object? specialization = $none,
  }) => $apply(
    FieldCopyWithData({
      if (clientUid != null) #clientUid: clientUid,
      if (lawyerUid != null) #lawyerUid: lawyerUid,
      if (caseText != null) #caseText: caseText,
      if (specializationId != $none) #specializationId: specializationId,
      if (specialization != $none) #specialization: specialization,
    }),
  );
  @override
  ConsultationCreateRequestModel $make(CopyWithData data) =>
      ConsultationCreateRequestModel(
        clientUid: data.get(#clientUid, or: $value.clientUid),
        lawyerUid: data.get(#lawyerUid, or: $value.lawyerUid),
        caseText: data.get(#caseText, or: $value.caseText),
        specializationId: data.get(
          #specializationId,
          or: $value.specializationId,
        ),
        specialization: data.get(#specialization, or: $value.specialization),
      );

  @override
  ConsultationCreateRequestModelCopyWith<
    $R2,
    ConsultationCreateRequestModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConsultationCreateRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ConsultationCreateResponseModelMapper
    extends ClassMapperBase<ConsultationCreateResponseModel> {
  ConsultationCreateResponseModelMapper._();

  static ConsultationCreateResponseModelMapper? _instance;
  static ConsultationCreateResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationCreateResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ConsultationCreateResponseModel';

  static ResultModel? _$result(ConsultationCreateResponseModel v) => v.result;
  static const Field<ConsultationCreateResponseModel, ResultModel> _f$result =
      Field('result', _$result, key: r'Result');
  static String? _$consultationId(ConsultationCreateResponseModel v) =>
      v.consultationId;
  static const Field<ConsultationCreateResponseModel, String>
  _f$consultationId = Field('consultationId', _$consultationId, opt: true);

  @override
  final MappableFields<ConsultationCreateResponseModel> fields = const {
    #result: _f$result,
    #consultationId: _f$consultationId,
  };
  @override
  final bool ignoreNull = true;

  static ConsultationCreateResponseModel _instantiate(DecodingData data) {
    return ConsultationCreateResponseModel(
      result: data.dec(_f$result),
      consultationId: data.dec(_f$consultationId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsultationCreateResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConsultationCreateResponseModel>(map);
  }

  static ConsultationCreateResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ConsultationCreateResponseModel>(
      json,
    );
  }
}

mixin ConsultationCreateResponseModelMappable {
  String toJsonString() {
    return ConsultationCreateResponseModelMapper.ensureInitialized()
        .encodeJson<ConsultationCreateResponseModel>(
          this as ConsultationCreateResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return ConsultationCreateResponseModelMapper.ensureInitialized()
        .encodeMap<ConsultationCreateResponseModel>(
          this as ConsultationCreateResponseModel,
        );
  }

  ConsultationCreateResponseModelCopyWith<
    ConsultationCreateResponseModel,
    ConsultationCreateResponseModel,
    ConsultationCreateResponseModel
  >
  get copyWith =>
      _ConsultationCreateResponseModelCopyWithImpl<
        ConsultationCreateResponseModel,
        ConsultationCreateResponseModel
      >(this as ConsultationCreateResponseModel, $identity, $identity);
  @override
  String toString() {
    return ConsultationCreateResponseModelMapper.ensureInitialized()
        .stringifyValue(this as ConsultationCreateResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return ConsultationCreateResponseModelMapper.ensureInitialized()
        .equalsValue(this as ConsultationCreateResponseModel, other);
  }

  @override
  int get hashCode {
    return ConsultationCreateResponseModelMapper.ensureInitialized().hashValue(
      this as ConsultationCreateResponseModel,
    );
  }
}

extension ConsultationCreateResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsultationCreateResponseModel, $Out> {
  ConsultationCreateResponseModelCopyWith<
    $R,
    ConsultationCreateResponseModel,
    $Out
  >
  get $asConsultationCreateResponseModel => $base.as(
    (v, t, t2) =>
        _ConsultationCreateResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsultationCreateResponseModelCopyWith<
  $R,
  $In extends ConsultationCreateResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? consultationId});
  ConsultationCreateResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ConsultationCreateResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsultationCreateResponseModel, $Out>
    implements
        ConsultationCreateResponseModelCopyWith<
          $R,
          ConsultationCreateResponseModel,
          $Out
        > {
  _ConsultationCreateResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<ConsultationCreateResponseModel> $mapper =
      ConsultationCreateResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? consultationId = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (consultationId != $none) #consultationId: consultationId,
    }),
  );
  @override
  ConsultationCreateResponseModel $make(CopyWithData data) =>
      ConsultationCreateResponseModel(
        result: data.get(#result, or: $value.result),
        consultationId: data.get(#consultationId, or: $value.consultationId),
      );

  @override
  ConsultationCreateResponseModelCopyWith<
    $R2,
    ConsultationCreateResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConsultationCreateResponseModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class ConsultationStatusUpdateRequestModelMapper
    extends ClassMapperBase<ConsultationStatusUpdateRequestModel> {
  ConsultationStatusUpdateRequestModelMapper._();

  static ConsultationStatusUpdateRequestModelMapper? _instance;
  static ConsultationStatusUpdateRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationStatusUpdateRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'ConsultationStatusUpdateRequestModel';

  static String _$status(ConsultationStatusUpdateRequestModel v) => v.status;
  static const Field<ConsultationStatusUpdateRequestModel, String> _f$status =
      Field('status', _$status);
  static String? _$closeReason(ConsultationStatusUpdateRequestModel v) =>
      v.closeReason;
  static const Field<ConsultationStatusUpdateRequestModel, String>
  _f$closeReason = Field('closeReason', _$closeReason, opt: true);

  @override
  final MappableFields<ConsultationStatusUpdateRequestModel> fields = const {
    #status: _f$status,
    #closeReason: _f$closeReason,
  };
  @override
  final bool ignoreNull = true;

  static ConsultationStatusUpdateRequestModel _instantiate(DecodingData data) {
    return ConsultationStatusUpdateRequestModel(
      status: data.dec(_f$status),
      closeReason: data.dec(_f$closeReason),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsultationStatusUpdateRequestModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<ConsultationStatusUpdateRequestModel>(
      map,
    );
  }

  static ConsultationStatusUpdateRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ConsultationStatusUpdateRequestModel>(
      json,
    );
  }
}

mixin ConsultationStatusUpdateRequestModelMappable {
  String toJsonString() {
    return ConsultationStatusUpdateRequestModelMapper.ensureInitialized()
        .encodeJson<ConsultationStatusUpdateRequestModel>(
          this as ConsultationStatusUpdateRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return ConsultationStatusUpdateRequestModelMapper.ensureInitialized()
        .encodeMap<ConsultationStatusUpdateRequestModel>(
          this as ConsultationStatusUpdateRequestModel,
        );
  }

  ConsultationStatusUpdateRequestModelCopyWith<
    ConsultationStatusUpdateRequestModel,
    ConsultationStatusUpdateRequestModel,
    ConsultationStatusUpdateRequestModel
  >
  get copyWith =>
      _ConsultationStatusUpdateRequestModelCopyWithImpl<
        ConsultationStatusUpdateRequestModel,
        ConsultationStatusUpdateRequestModel
      >(this as ConsultationStatusUpdateRequestModel, $identity, $identity);
  @override
  String toString() {
    return ConsultationStatusUpdateRequestModelMapper.ensureInitialized()
        .stringifyValue(this as ConsultationStatusUpdateRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return ConsultationStatusUpdateRequestModelMapper.ensureInitialized()
        .equalsValue(this as ConsultationStatusUpdateRequestModel, other);
  }

  @override
  int get hashCode {
    return ConsultationStatusUpdateRequestModelMapper.ensureInitialized()
        .hashValue(this as ConsultationStatusUpdateRequestModel);
  }
}

extension ConsultationStatusUpdateRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsultationStatusUpdateRequestModel, $Out> {
  ConsultationStatusUpdateRequestModelCopyWith<
    $R,
    ConsultationStatusUpdateRequestModel,
    $Out
  >
  get $asConsultationStatusUpdateRequestModel => $base.as(
    (v, t, t2) =>
        _ConsultationStatusUpdateRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsultationStatusUpdateRequestModelCopyWith<
  $R,
  $In extends ConsultationStatusUpdateRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status, String? closeReason});
  ConsultationStatusUpdateRequestModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConsultationStatusUpdateRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsultationStatusUpdateRequestModel, $Out>
    implements
        ConsultationStatusUpdateRequestModelCopyWith<
          $R,
          ConsultationStatusUpdateRequestModel,
          $Out
        > {
  _ConsultationStatusUpdateRequestModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<ConsultationStatusUpdateRequestModel> $mapper =
      ConsultationStatusUpdateRequestModelMapper.ensureInitialized();
  @override
  $R call({String? status, Object? closeReason = $none}) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (closeReason != $none) #closeReason: closeReason,
    }),
  );
  @override
  ConsultationStatusUpdateRequestModel $make(CopyWithData data) =>
      ConsultationStatusUpdateRequestModel(
        status: data.get(#status, or: $value.status),
        closeReason: data.get(#closeReason, or: $value.closeReason),
      );

  @override
  ConsultationStatusUpdateRequestModelCopyWith<
    $R2,
    ConsultationStatusUpdateRequestModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConsultationStatusUpdateRequestModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class ConsultationStatusUpdateResponseModelMapper
    extends ClassMapperBase<ConsultationStatusUpdateResponseModel> {
  ConsultationStatusUpdateResponseModelMapper._();

  static ConsultationStatusUpdateResponseModelMapper? _instance;
  static ConsultationStatusUpdateResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationStatusUpdateResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ConsultationStatusUpdateResponseModel';

  static ResultModel? _$result(ConsultationStatusUpdateResponseModel v) =>
      v.result;
  static const Field<ConsultationStatusUpdateResponseModel, ResultModel>
  _f$result = Field('result', _$result, key: r'Result');
  static String? _$status(ConsultationStatusUpdateResponseModel v) => v.status;
  static const Field<ConsultationStatusUpdateResponseModel, String> _f$status =
      Field('status', _$status, opt: true);

  @override
  final MappableFields<ConsultationStatusUpdateResponseModel> fields = const {
    #result: _f$result,
    #status: _f$status,
  };
  @override
  final bool ignoreNull = true;

  static ConsultationStatusUpdateResponseModel _instantiate(DecodingData data) {
    return ConsultationStatusUpdateResponseModel(
      result: data.dec(_f$result),
      status: data.dec(_f$status),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsultationStatusUpdateResponseModel fromJson(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<ConsultationStatusUpdateResponseModel>(
      map,
    );
  }

  static ConsultationStatusUpdateResponseModel fromJsonString(String json) {
    return ensureInitialized()
        .decodeJson<ConsultationStatusUpdateResponseModel>(json);
  }
}

mixin ConsultationStatusUpdateResponseModelMappable {
  String toJsonString() {
    return ConsultationStatusUpdateResponseModelMapper.ensureInitialized()
        .encodeJson<ConsultationStatusUpdateResponseModel>(
          this as ConsultationStatusUpdateResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return ConsultationStatusUpdateResponseModelMapper.ensureInitialized()
        .encodeMap<ConsultationStatusUpdateResponseModel>(
          this as ConsultationStatusUpdateResponseModel,
        );
  }

  ConsultationStatusUpdateResponseModelCopyWith<
    ConsultationStatusUpdateResponseModel,
    ConsultationStatusUpdateResponseModel,
    ConsultationStatusUpdateResponseModel
  >
  get copyWith =>
      _ConsultationStatusUpdateResponseModelCopyWithImpl<
        ConsultationStatusUpdateResponseModel,
        ConsultationStatusUpdateResponseModel
      >(this as ConsultationStatusUpdateResponseModel, $identity, $identity);
  @override
  String toString() {
    return ConsultationStatusUpdateResponseModelMapper.ensureInitialized()
        .stringifyValue(this as ConsultationStatusUpdateResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return ConsultationStatusUpdateResponseModelMapper.ensureInitialized()
        .equalsValue(this as ConsultationStatusUpdateResponseModel, other);
  }

  @override
  int get hashCode {
    return ConsultationStatusUpdateResponseModelMapper.ensureInitialized()
        .hashValue(this as ConsultationStatusUpdateResponseModel);
  }
}

extension ConsultationStatusUpdateResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsultationStatusUpdateResponseModel, $Out> {
  ConsultationStatusUpdateResponseModelCopyWith<
    $R,
    ConsultationStatusUpdateResponseModel,
    $Out
  >
  get $asConsultationStatusUpdateResponseModel => $base.as(
    (v, t, t2) =>
        _ConsultationStatusUpdateResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsultationStatusUpdateResponseModelCopyWith<
  $R,
  $In extends ConsultationStatusUpdateResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? status});
  ConsultationStatusUpdateResponseModelCopyWith<$R2, $In, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConsultationStatusUpdateResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsultationStatusUpdateResponseModel, $Out>
    implements
        ConsultationStatusUpdateResponseModelCopyWith<
          $R,
          ConsultationStatusUpdateResponseModel,
          $Out
        > {
  _ConsultationStatusUpdateResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<ConsultationStatusUpdateResponseModel> $mapper =
      ConsultationStatusUpdateResponseModelMapper.ensureInitialized();
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
  ConsultationStatusUpdateResponseModel $make(CopyWithData data) =>
      ConsultationStatusUpdateResponseModel(
        result: data.get(#result, or: $value.result),
        status: data.get(#status, or: $value.status),
      );

  @override
  ConsultationStatusUpdateResponseModelCopyWith<
    $R2,
    ConsultationStatusUpdateResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConsultationStatusUpdateResponseModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

