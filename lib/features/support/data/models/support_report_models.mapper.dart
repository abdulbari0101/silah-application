// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'support_report_models.dart';

class SupportReportRequestModelMapper
    extends ClassMapperBase<SupportReportRequestModel> {
  SupportReportRequestModelMapper._();

  static SupportReportRequestModelMapper? _instance;
  static SupportReportRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportRequestModel';

  static String _$reporterUid(SupportReportRequestModel v) => v.reporterUid;
  static const Field<SupportReportRequestModel, String> _f$reporterUid = Field(
    'reporterUid',
    _$reporterUid,
  );
  static String? _$subject(SupportReportRequestModel v) => v.subject;
  static const Field<SupportReportRequestModel, String> _f$subject = Field(
    'subject',
    _$subject,
    opt: true,
  );
  static String _$details(SupportReportRequestModel v) => v.details;
  static const Field<SupportReportRequestModel, String> _f$details = Field(
    'details',
    _$details,
  );

  @override
  final MappableFields<SupportReportRequestModel> fields = const {
    #reporterUid: _f$reporterUid,
    #subject: _f$subject,
    #details: _f$details,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportRequestModel _instantiate(DecodingData data) {
    return SupportReportRequestModel(
      reporterUid: data.dec(_f$reporterUid),
      subject: data.dec(_f$subject),
      details: data.dec(_f$details),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportRequestModel>(map);
  }

  static SupportReportRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportRequestModel>(json);
  }
}

mixin SupportReportRequestModelMappable {
  String toJsonString() {
    return SupportReportRequestModelMapper.ensureInitialized()
        .encodeJson<SupportReportRequestModel>(
          this as SupportReportRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportRequestModelMapper.ensureInitialized()
        .encodeMap<SupportReportRequestModel>(
          this as SupportReportRequestModel,
        );
  }

  SupportReportRequestModelCopyWith<
    SupportReportRequestModel,
    SupportReportRequestModel,
    SupportReportRequestModel
  >
  get copyWith =>
      _SupportReportRequestModelCopyWithImpl<
        SupportReportRequestModel,
        SupportReportRequestModel
      >(this as SupportReportRequestModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportRequestModelMapper.ensureInitialized().stringifyValue(
      this as SupportReportRequestModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportReportRequestModelMapper.ensureInitialized().equalsValue(
      this as SupportReportRequestModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportReportRequestModelMapper.ensureInitialized().hashValue(
      this as SupportReportRequestModel,
    );
  }
}

extension SupportReportRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportRequestModel, $Out> {
  SupportReportRequestModelCopyWith<$R, SupportReportRequestModel, $Out>
  get $asSupportReportRequestModel => $base.as(
    (v, t, t2) => _SupportReportRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportRequestModelCopyWith<
  $R,
  $In extends SupportReportRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? reporterUid, String? subject, String? details});
  SupportReportRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportRequestModel, $Out>
    implements
        SupportReportRequestModelCopyWith<$R, SupportReportRequestModel, $Out> {
  _SupportReportRequestModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportReportRequestModel> $mapper =
      SupportReportRequestModelMapper.ensureInitialized();
  @override
  $R call({String? reporterUid, Object? subject = $none, String? details}) =>
      $apply(
        FieldCopyWithData({
          if (reporterUid != null) #reporterUid: reporterUid,
          if (subject != $none) #subject: subject,
          if (details != null) #details: details,
        }),
      );
  @override
  SupportReportRequestModel $make(CopyWithData data) =>
      SupportReportRequestModel(
        reporterUid: data.get(#reporterUid, or: $value.reporterUid),
        subject: data.get(#subject, or: $value.subject),
        details: data.get(#details, or: $value.details),
      );

  @override
  SupportReportRequestModelCopyWith<$R2, SupportReportRequestModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportRequestModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SupportReportReviewRequestModelMapper
    extends ClassMapperBase<SupportReportReviewRequestModel> {
  SupportReportReviewRequestModelMapper._();

  static SupportReportReviewRequestModelMapper? _instance;
  static SupportReportReviewRequestModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportReviewRequestModelMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportReviewRequestModel';

  static String _$status(SupportReportReviewRequestModel v) => v.status;
  static const Field<SupportReportReviewRequestModel, String> _f$status = Field(
    'status',
    _$status,
  );
  static String? _$adminNotes(SupportReportReviewRequestModel v) =>
      v.adminNotes;
  static const Field<SupportReportReviewRequestModel, String> _f$adminNotes =
      Field('adminNotes', _$adminNotes, opt: true);

  @override
  final MappableFields<SupportReportReviewRequestModel> fields = const {
    #status: _f$status,
    #adminNotes: _f$adminNotes,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportReviewRequestModel _instantiate(DecodingData data) {
    return SupportReportReviewRequestModel(
      status: data.dec(_f$status),
      adminNotes: data.dec(_f$adminNotes),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportReviewRequestModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportReviewRequestModel>(map);
  }

  static SupportReportReviewRequestModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportReviewRequestModel>(
      json,
    );
  }
}

mixin SupportReportReviewRequestModelMappable {
  String toJsonString() {
    return SupportReportReviewRequestModelMapper.ensureInitialized()
        .encodeJson<SupportReportReviewRequestModel>(
          this as SupportReportReviewRequestModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportReviewRequestModelMapper.ensureInitialized()
        .encodeMap<SupportReportReviewRequestModel>(
          this as SupportReportReviewRequestModel,
        );
  }

  SupportReportReviewRequestModelCopyWith<
    SupportReportReviewRequestModel,
    SupportReportReviewRequestModel,
    SupportReportReviewRequestModel
  >
  get copyWith =>
      _SupportReportReviewRequestModelCopyWithImpl<
        SupportReportReviewRequestModel,
        SupportReportReviewRequestModel
      >(this as SupportReportReviewRequestModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportReviewRequestModelMapper.ensureInitialized()
        .stringifyValue(this as SupportReportReviewRequestModel);
  }

  @override
  bool operator ==(Object other) {
    return SupportReportReviewRequestModelMapper.ensureInitialized()
        .equalsValue(this as SupportReportReviewRequestModel, other);
  }

  @override
  int get hashCode {
    return SupportReportReviewRequestModelMapper.ensureInitialized().hashValue(
      this as SupportReportReviewRequestModel,
    );
  }
}

extension SupportReportReviewRequestModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportReviewRequestModel, $Out> {
  SupportReportReviewRequestModelCopyWith<
    $R,
    SupportReportReviewRequestModel,
    $Out
  >
  get $asSupportReportReviewRequestModel => $base.as(
    (v, t, t2) =>
        _SupportReportReviewRequestModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportReviewRequestModelCopyWith<
  $R,
  $In extends SupportReportReviewRequestModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status, String? adminNotes});
  SupportReportReviewRequestModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportReviewRequestModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportReviewRequestModel, $Out>
    implements
        SupportReportReviewRequestModelCopyWith<
          $R,
          SupportReportReviewRequestModel,
          $Out
        > {
  _SupportReportReviewRequestModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<SupportReportReviewRequestModel> $mapper =
      SupportReportReviewRequestModelMapper.ensureInitialized();
  @override
  $R call({String? status, Object? adminNotes = $none}) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (adminNotes != $none) #adminNotes: adminNotes,
    }),
  );
  @override
  SupportReportReviewRequestModel $make(CopyWithData data) =>
      SupportReportReviewRequestModel(
        status: data.get(#status, or: $value.status),
        adminNotes: data.get(#adminNotes, or: $value.adminNotes),
      );

  @override
  SupportReportReviewRequestModelCopyWith<
    $R2,
    SupportReportReviewRequestModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportReviewRequestModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class SupportReportResponseModelMapper
    extends ClassMapperBase<SupportReportResponseModel> {
  SupportReportResponseModelMapper._();

  static SupportReportResponseModelMapper? _instance;
  static SupportReportResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportResponseModel';

  static ResultModel? _$result(SupportReportResponseModel v) => v.result;
  static const Field<SupportReportResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static String? _$reportId(SupportReportResponseModel v) => v.reportId;
  static const Field<SupportReportResponseModel, String> _f$reportId = Field(
    'reportId',
    _$reportId,
    opt: true,
  );

  @override
  final MappableFields<SupportReportResponseModel> fields = const {
    #result: _f$result,
    #reportId: _f$reportId,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportResponseModel _instantiate(DecodingData data) {
    return SupportReportResponseModel(
      result: data.dec(_f$result),
      reportId: data.dec(_f$reportId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportResponseModel>(map);
  }

  static SupportReportResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportResponseModel>(json);
  }
}

mixin SupportReportResponseModelMappable {
  String toJsonString() {
    return SupportReportResponseModelMapper.ensureInitialized()
        .encodeJson<SupportReportResponseModel>(
          this as SupportReportResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportResponseModelMapper.ensureInitialized()
        .encodeMap<SupportReportResponseModel>(
          this as SupportReportResponseModel,
        );
  }

  SupportReportResponseModelCopyWith<
    SupportReportResponseModel,
    SupportReportResponseModel,
    SupportReportResponseModel
  >
  get copyWith =>
      _SupportReportResponseModelCopyWithImpl<
        SupportReportResponseModel,
        SupportReportResponseModel
      >(this as SupportReportResponseModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportResponseModelMapper.ensureInitialized().stringifyValue(
      this as SupportReportResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportReportResponseModelMapper.ensureInitialized().equalsValue(
      this as SupportReportResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportReportResponseModelMapper.ensureInitialized().hashValue(
      this as SupportReportResponseModel,
    );
  }
}

extension SupportReportResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportResponseModel, $Out> {
  SupportReportResponseModelCopyWith<$R, SupportReportResponseModel, $Out>
  get $asSupportReportResponseModel => $base.as(
    (v, t, t2) => _SupportReportResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportResponseModelCopyWith<
  $R,
  $In extends SupportReportResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, String? reportId});
  SupportReportResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportResponseModel, $Out>
    implements
        SupportReportResponseModelCopyWith<
          $R,
          SupportReportResponseModel,
          $Out
        > {
  _SupportReportResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportReportResponseModel> $mapper =
      SupportReportResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? reportId = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (reportId != $none) #reportId: reportId,
    }),
  );
  @override
  SupportReportResponseModel $make(CopyWithData data) =>
      SupportReportResponseModel(
        result: data.get(#result, or: $value.result),
        reportId: data.get(#reportId, or: $value.reportId),
      );

  @override
  SupportReportResponseModelCopyWith<$R2, SupportReportResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SupportReportReviewResponseModelMapper
    extends ClassMapperBase<SupportReportReviewResponseModel> {
  SupportReportReviewResponseModelMapper._();

  static SupportReportReviewResponseModelMapper? _instance;
  static SupportReportReviewResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportReportReviewResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupportReportReviewResponseModel';

  static ResultModel? _$result(SupportReportReviewResponseModel v) => v.result;
  static const Field<SupportReportReviewResponseModel, ResultModel> _f$result =
      Field('result', _$result, key: r'Result');
  static String? _$reportId(SupportReportReviewResponseModel v) => v.reportId;
  static const Field<SupportReportReviewResponseModel, String> _f$reportId =
      Field('reportId', _$reportId, opt: true);
  static String? _$status(SupportReportReviewResponseModel v) => v.status;
  static const Field<SupportReportReviewResponseModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$adminNotes(SupportReportReviewResponseModel v) =>
      v.adminNotes;
  static const Field<SupportReportReviewResponseModel, String> _f$adminNotes =
      Field('adminNotes', _$adminNotes, opt: true);
  static String? _$updatedAt(SupportReportReviewResponseModel v) => v.updatedAt;
  static const Field<SupportReportReviewResponseModel, String> _f$updatedAt =
      Field('updatedAt', _$updatedAt, opt: true);

  @override
  final MappableFields<SupportReportReviewResponseModel> fields = const {
    #result: _f$result,
    #reportId: _f$reportId,
    #status: _f$status,
    #adminNotes: _f$adminNotes,
    #updatedAt: _f$updatedAt,
  };
  @override
  final bool ignoreNull = true;

  static SupportReportReviewResponseModel _instantiate(DecodingData data) {
    return SupportReportReviewResponseModel(
      result: data.dec(_f$result),
      reportId: data.dec(_f$reportId),
      status: data.dec(_f$status),
      adminNotes: data.dec(_f$adminNotes),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportReportReviewResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportReportReviewResponseModel>(map);
  }

  static SupportReportReviewResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportReportReviewResponseModel>(
      json,
    );
  }
}

mixin SupportReportReviewResponseModelMappable {
  String toJsonString() {
    return SupportReportReviewResponseModelMapper.ensureInitialized()
        .encodeJson<SupportReportReviewResponseModel>(
          this as SupportReportReviewResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportReportReviewResponseModelMapper.ensureInitialized()
        .encodeMap<SupportReportReviewResponseModel>(
          this as SupportReportReviewResponseModel,
        );
  }

  SupportReportReviewResponseModelCopyWith<
    SupportReportReviewResponseModel,
    SupportReportReviewResponseModel,
    SupportReportReviewResponseModel
  >
  get copyWith =>
      _SupportReportReviewResponseModelCopyWithImpl<
        SupportReportReviewResponseModel,
        SupportReportReviewResponseModel
      >(this as SupportReportReviewResponseModel, $identity, $identity);
  @override
  String toString() {
    return SupportReportReviewResponseModelMapper.ensureInitialized()
        .stringifyValue(this as SupportReportReviewResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return SupportReportReviewResponseModelMapper.ensureInitialized()
        .equalsValue(this as SupportReportReviewResponseModel, other);
  }

  @override
  int get hashCode {
    return SupportReportReviewResponseModelMapper.ensureInitialized().hashValue(
      this as SupportReportReviewResponseModel,
    );
  }
}

extension SupportReportReviewResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportReportReviewResponseModel, $Out> {
  SupportReportReviewResponseModelCopyWith<
    $R,
    SupportReportReviewResponseModel,
    $Out
  >
  get $asSupportReportReviewResponseModel => $base.as(
    (v, t, t2) =>
        _SupportReportReviewResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportReportReviewResponseModelCopyWith<
  $R,
  $In extends SupportReportReviewResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({
    ResultModel? result,
    String? reportId,
    String? status,
    String? adminNotes,
    String? updatedAt,
  });
  SupportReportReviewResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportReportReviewResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportReportReviewResponseModel, $Out>
    implements
        SupportReportReviewResponseModelCopyWith<
          $R,
          SupportReportReviewResponseModel,
          $Out
        > {
  _SupportReportReviewResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<SupportReportReviewResponseModel> $mapper =
      SupportReportReviewResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({
    Object? result = $none,
    Object? reportId = $none,
    Object? status = $none,
    Object? adminNotes = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (reportId != $none) #reportId: reportId,
      if (status != $none) #status: status,
      if (adminNotes != $none) #adminNotes: adminNotes,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  SupportReportReviewResponseModel $make(CopyWithData data) =>
      SupportReportReviewResponseModel(
        result: data.get(#result, or: $value.result),
        reportId: data.get(#reportId, or: $value.reportId),
        status: data.get(#status, or: $value.status),
        adminNotes: data.get(#adminNotes, or: $value.adminNotes),
        updatedAt: data.get(#updatedAt, or: $value.updatedAt),
      );

  @override
  SupportReportReviewResponseModelCopyWith<
    $R2,
    SupportReportReviewResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportReportReviewResponseModelCopyWithImpl<$R2, $Out2>(
        $value,
        $cast,
        t,
      );
}

class SupportTicketItemModelMapper
    extends ClassMapperBase<SupportTicketItemModel> {
  SupportTicketItemModelMapper._();

  static SupportTicketItemModelMapper? _instance;
  static SupportTicketItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SupportTicketItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SupportTicketItemModel';

  static String? _$reportId(SupportTicketItemModel v) => v.reportId;
  static const Field<SupportTicketItemModel, String> _f$reportId = Field(
    'reportId',
    _$reportId,
    opt: true,
  );
  static String? _$reporterUid(SupportTicketItemModel v) => v.reporterUid;
  static const Field<SupportTicketItemModel, String> _f$reporterUid = Field(
    'reporterUid',
    _$reporterUid,
    opt: true,
  );
  static String? _$role(SupportTicketItemModel v) => v.role;
  static const Field<SupportTicketItemModel, String> _f$role = Field(
    'role',
    _$role,
    opt: true,
  );
  static String? _$subject(SupportTicketItemModel v) => v.subject;
  static const Field<SupportTicketItemModel, String> _f$subject = Field(
    'subject',
    _$subject,
    opt: true,
  );
  static String? _$details(SupportTicketItemModel v) => v.details;
  static const Field<SupportTicketItemModel, String> _f$details = Field(
    'details',
    _$details,
    opt: true,
  );
  static String? _$status(SupportTicketItemModel v) => v.status;
  static const Field<SupportTicketItemModel, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$adminNotes(SupportTicketItemModel v) => v.adminNotes;
  static const Field<SupportTicketItemModel, String> _f$adminNotes = Field(
    'adminNotes',
    _$adminNotes,
    opt: true,
  );
  static String? _$createdAt(SupportTicketItemModel v) => v.createdAt;
  static const Field<SupportTicketItemModel, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String? _$updatedAt(SupportTicketItemModel v) => v.updatedAt;
  static const Field<SupportTicketItemModel, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<SupportTicketItemModel> fields = const {
    #reportId: _f$reportId,
    #reporterUid: _f$reporterUid,
    #role: _f$role,
    #subject: _f$subject,
    #details: _f$details,
    #status: _f$status,
    #adminNotes: _f$adminNotes,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };
  @override
  final bool ignoreNull = true;

  static SupportTicketItemModel _instantiate(DecodingData data) {
    return SupportTicketItemModel(
      reportId: data.dec(_f$reportId),
      reporterUid: data.dec(_f$reporterUid),
      role: data.dec(_f$role),
      subject: data.dec(_f$subject),
      details: data.dec(_f$details),
      status: data.dec(_f$status),
      adminNotes: data.dec(_f$adminNotes),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportTicketItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportTicketItemModel>(map);
  }

  static SupportTicketItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportTicketItemModel>(json);
  }
}

mixin SupportTicketItemModelMappable {
  String toJsonString() {
    return SupportTicketItemModelMapper.ensureInitialized()
        .encodeJson<SupportTicketItemModel>(this as SupportTicketItemModel);
  }

  Map<String, dynamic> toJson() {
    return SupportTicketItemModelMapper.ensureInitialized()
        .encodeMap<SupportTicketItemModel>(this as SupportTicketItemModel);
  }

  SupportTicketItemModelCopyWith<
    SupportTicketItemModel,
    SupportTicketItemModel,
    SupportTicketItemModel
  >
  get copyWith =>
      _SupportTicketItemModelCopyWithImpl<
        SupportTicketItemModel,
        SupportTicketItemModel
      >(this as SupportTicketItemModel, $identity, $identity);
  @override
  String toString() {
    return SupportTicketItemModelMapper.ensureInitialized().stringifyValue(
      this as SupportTicketItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportTicketItemModelMapper.ensureInitialized().equalsValue(
      this as SupportTicketItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportTicketItemModelMapper.ensureInitialized().hashValue(
      this as SupportTicketItemModel,
    );
  }
}

extension SupportTicketItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportTicketItemModel, $Out> {
  SupportTicketItemModelCopyWith<$R, SupportTicketItemModel, $Out>
  get $asSupportTicketItemModel => $base.as(
    (v, t, t2) => _SupportTicketItemModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportTicketItemModelCopyWith<
  $R,
  $In extends SupportTicketItemModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? reportId,
    String? reporterUid,
    String? role,
    String? subject,
    String? details,
    String? status,
    String? adminNotes,
    String? createdAt,
    String? updatedAt,
  });
  SupportTicketItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportTicketItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportTicketItemModel, $Out>
    implements
        SupportTicketItemModelCopyWith<$R, SupportTicketItemModel, $Out> {
  _SupportTicketItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportTicketItemModel> $mapper =
      SupportTicketItemModelMapper.ensureInitialized();
  @override
  $R call({
    Object? reportId = $none,
    Object? reporterUid = $none,
    Object? role = $none,
    Object? subject = $none,
    Object? details = $none,
    Object? status = $none,
    Object? adminNotes = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (reportId != $none) #reportId: reportId,
      if (reporterUid != $none) #reporterUid: reporterUid,
      if (role != $none) #role: role,
      if (subject != $none) #subject: subject,
      if (details != $none) #details: details,
      if (status != $none) #status: status,
      if (adminNotes != $none) #adminNotes: adminNotes,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  SupportTicketItemModel $make(CopyWithData data) => SupportTicketItemModel(
    reportId: data.get(#reportId, or: $value.reportId),
    reporterUid: data.get(#reporterUid, or: $value.reporterUid),
    role: data.get(#role, or: $value.role),
    subject: data.get(#subject, or: $value.subject),
    details: data.get(#details, or: $value.details),
    status: data.get(#status, or: $value.status),
    adminNotes: data.get(#adminNotes, or: $value.adminNotes),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  SupportTicketItemModelCopyWith<$R2, SupportTicketItemModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportTicketItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class SupportTicketsResponseModelMapper
    extends ClassMapperBase<SupportTicketsResponseModel> {
  SupportTicketsResponseModelMapper._();

  static SupportTicketsResponseModelMapper? _instance;
  static SupportTicketsResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SupportTicketsResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
      SupportTicketItemModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupportTicketsResponseModel';

  static ResultModel? _$result(SupportTicketsResponseModel v) => v.result;
  static const Field<SupportTicketsResponseModel, ResultModel> _f$result =
      Field('result', _$result, key: r'Result');
  static List<SupportTicketItemModel>? _$reports(
    SupportTicketsResponseModel v,
  ) => v.reports;
  static const Field<SupportTicketsResponseModel, List<SupportTicketItemModel>>
  _f$reports = Field('reports', _$reports, opt: true);

  @override
  final MappableFields<SupportTicketsResponseModel> fields = const {
    #result: _f$result,
    #reports: _f$reports,
  };
  @override
  final bool ignoreNull = true;

  static SupportTicketsResponseModel _instantiate(DecodingData data) {
    return SupportTicketsResponseModel(
      result: data.dec(_f$result),
      reports: data.dec(_f$reports),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportTicketsResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportTicketsResponseModel>(map);
  }

  static SupportTicketsResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportTicketsResponseModel>(json);
  }
}

mixin SupportTicketsResponseModelMappable {
  String toJsonString() {
    return SupportTicketsResponseModelMapper.ensureInitialized()
        .encodeJson<SupportTicketsResponseModel>(
          this as SupportTicketsResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return SupportTicketsResponseModelMapper.ensureInitialized()
        .encodeMap<SupportTicketsResponseModel>(
          this as SupportTicketsResponseModel,
        );
  }

  SupportTicketsResponseModelCopyWith<
    SupportTicketsResponseModel,
    SupportTicketsResponseModel,
    SupportTicketsResponseModel
  >
  get copyWith =>
      _SupportTicketsResponseModelCopyWithImpl<
        SupportTicketsResponseModel,
        SupportTicketsResponseModel
      >(this as SupportTicketsResponseModel, $identity, $identity);
  @override
  String toString() {
    return SupportTicketsResponseModelMapper.ensureInitialized().stringifyValue(
      this as SupportTicketsResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportTicketsResponseModelMapper.ensureInitialized().equalsValue(
      this as SupportTicketsResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportTicketsResponseModelMapper.ensureInitialized().hashValue(
      this as SupportTicketsResponseModel,
    );
  }
}

extension SupportTicketsResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportTicketsResponseModel, $Out> {
  SupportTicketsResponseModelCopyWith<$R, SupportTicketsResponseModel, $Out>
  get $asSupportTicketsResponseModel => $base.as(
    (v, t, t2) => _SupportTicketsResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportTicketsResponseModelCopyWith<
  $R,
  $In extends SupportTicketsResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  ListCopyWith<
    $R,
    SupportTicketItemModel,
    SupportTicketItemModelCopyWith<
      $R,
      SupportTicketItemModel,
      SupportTicketItemModel
    >
  >?
  get reports;
  @override
  $R call({ResultModel? result, List<SupportTicketItemModel>? reports});
  SupportTicketsResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportTicketsResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportTicketsResponseModel, $Out>
    implements
        SupportTicketsResponseModelCopyWith<
          $R,
          SupportTicketsResponseModel,
          $Out
        > {
  _SupportTicketsResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<SupportTicketsResponseModel> $mapper =
      SupportTicketsResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  ListCopyWith<
    $R,
    SupportTicketItemModel,
    SupportTicketItemModelCopyWith<
      $R,
      SupportTicketItemModel,
      SupportTicketItemModel
    >
  >?
  get reports => $value.reports != null
      ? ListCopyWith(
          $value.reports!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(reports: v),
        )
      : null;
  @override
  $R call({Object? result = $none, Object? reports = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (reports != $none) #reports: reports,
    }),
  );
  @override
  SupportTicketsResponseModel $make(CopyWithData data) =>
      SupportTicketsResponseModel(
        result: data.get(#result, or: $value.result),
        reports: data.get(#reports, or: $value.reports),
      );

  @override
  SupportTicketsResponseModelCopyWith<$R2, SupportTicketsResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportTicketsResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

