// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'training_application_entity.dart';

class TrainingApplicationEntityMapper
    extends ClassMapperBase<TrainingApplicationEntity> {
  TrainingApplicationEntityMapper._();

  static TrainingApplicationEntityMapper? _instance;
  static TrainingApplicationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TrainingApplicationEntityMapper._(),
      );
      TrainingApplicationStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TrainingApplicationEntity';

  static int? _$id(TrainingApplicationEntity v) => v.id;
  static const Field<TrainingApplicationEntity, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static int? _$opportunityId(TrainingApplicationEntity v) => v.opportunityId;
  static const Field<TrainingApplicationEntity, int> _f$opportunityId = Field(
    'opportunityId',
    _$opportunityId,
    opt: true,
  );
  static String? _$traineeId(TrainingApplicationEntity v) => v.traineeId;
  static const Field<TrainingApplicationEntity, String> _f$traineeId = Field(
    'traineeId',
    _$traineeId,
    opt: true,
  );
  static String? _$fullName(TrainingApplicationEntity v) => v.fullName;
  static const Field<TrainingApplicationEntity, String> _f$fullName = Field(
    'fullName',
    _$fullName,
    opt: true,
  );
  static String? _$university(TrainingApplicationEntity v) => v.university;
  static const Field<TrainingApplicationEntity, String> _f$university = Field(
    'university',
    _$university,
    opt: true,
  );
  static String? _$faculty(TrainingApplicationEntity v) => v.faculty;
  static const Field<TrainingApplicationEntity, String> _f$faculty = Field(
    'faculty',
    _$faculty,
    opt: true,
  );
  static String? _$city(TrainingApplicationEntity v) => v.city;
  static const Field<TrainingApplicationEntity, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$graduationYear(TrainingApplicationEntity v) =>
      v.graduationYear;
  static const Field<TrainingApplicationEntity, String> _f$graduationYear =
      Field('graduationYear', _$graduationYear, opt: true);
  static String? _$cvUrl(TrainingApplicationEntity v) => v.cvUrl;
  static const Field<TrainingApplicationEntity, String> _f$cvUrl = Field(
    'cvUrl',
    _$cvUrl,
    opt: true,
  );
  static TrainingApplicationStatus _$status(TrainingApplicationEntity v) =>
      v.status;
  static const Field<TrainingApplicationEntity, TrainingApplicationStatus>
  _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: TrainingApplicationStatus.pending,
  );
  static String? _$submittedAt(TrainingApplicationEntity v) => v.submittedAt;
  static const Field<TrainingApplicationEntity, String> _f$submittedAt = Field(
    'submittedAt',
    _$submittedAt,
    opt: true,
  );

  @override
  final MappableFields<TrainingApplicationEntity> fields = const {
    #id: _f$id,
    #opportunityId: _f$opportunityId,
    #traineeId: _f$traineeId,
    #fullName: _f$fullName,
    #university: _f$university,
    #faculty: _f$faculty,
    #city: _f$city,
    #graduationYear: _f$graduationYear,
    #cvUrl: _f$cvUrl,
    #status: _f$status,
    #submittedAt: _f$submittedAt,
  };
  @override
  final bool ignoreNull = true;

  static TrainingApplicationEntity _instantiate(DecodingData data) {
    return TrainingApplicationEntity(
      id: data.dec(_f$id),
      opportunityId: data.dec(_f$opportunityId),
      traineeId: data.dec(_f$traineeId),
      fullName: data.dec(_f$fullName),
      university: data.dec(_f$university),
      faculty: data.dec(_f$faculty),
      city: data.dec(_f$city),
      graduationYear: data.dec(_f$graduationYear),
      cvUrl: data.dec(_f$cvUrl),
      status: data.dec(_f$status),
      submittedAt: data.dec(_f$submittedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TrainingApplicationEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TrainingApplicationEntity>(map);
  }

  static TrainingApplicationEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<TrainingApplicationEntity>(json);
  }
}

mixin TrainingApplicationEntityMappable {
  String toJsonString() {
    return TrainingApplicationEntityMapper.ensureInitialized()
        .encodeJson<TrainingApplicationEntity>(
          this as TrainingApplicationEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return TrainingApplicationEntityMapper.ensureInitialized()
        .encodeMap<TrainingApplicationEntity>(
          this as TrainingApplicationEntity,
        );
  }

  TrainingApplicationEntityCopyWith<
    TrainingApplicationEntity,
    TrainingApplicationEntity,
    TrainingApplicationEntity
  >
  get copyWith =>
      _TrainingApplicationEntityCopyWithImpl<
        TrainingApplicationEntity,
        TrainingApplicationEntity
      >(this as TrainingApplicationEntity, $identity, $identity);
  @override
  String toString() {
    return TrainingApplicationEntityMapper.ensureInitialized().stringifyValue(
      this as TrainingApplicationEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return TrainingApplicationEntityMapper.ensureInitialized().equalsValue(
      this as TrainingApplicationEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return TrainingApplicationEntityMapper.ensureInitialized().hashValue(
      this as TrainingApplicationEntity,
    );
  }
}

extension TrainingApplicationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TrainingApplicationEntity, $Out> {
  TrainingApplicationEntityCopyWith<$R, TrainingApplicationEntity, $Out>
  get $asTrainingApplicationEntity => $base.as(
    (v, t, t2) => _TrainingApplicationEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TrainingApplicationEntityCopyWith<
  $R,
  $In extends TrainingApplicationEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    int? opportunityId,
    String? traineeId,
    String? fullName,
    String? university,
    String? faculty,
    String? city,
    String? graduationYear,
    String? cvUrl,
    TrainingApplicationStatus? status,
    String? submittedAt,
  });
  TrainingApplicationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TrainingApplicationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TrainingApplicationEntity, $Out>
    implements
        TrainingApplicationEntityCopyWith<$R, TrainingApplicationEntity, $Out> {
  _TrainingApplicationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TrainingApplicationEntity> $mapper =
      TrainingApplicationEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? opportunityId = $none,
    Object? traineeId = $none,
    Object? fullName = $none,
    Object? university = $none,
    Object? faculty = $none,
    Object? city = $none,
    Object? graduationYear = $none,
    Object? cvUrl = $none,
    TrainingApplicationStatus? status,
    Object? submittedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (opportunityId != $none) #opportunityId: opportunityId,
      if (traineeId != $none) #traineeId: traineeId,
      if (fullName != $none) #fullName: fullName,
      if (university != $none) #university: university,
      if (faculty != $none) #faculty: faculty,
      if (city != $none) #city: city,
      if (graduationYear != $none) #graduationYear: graduationYear,
      if (cvUrl != $none) #cvUrl: cvUrl,
      if (status != null) #status: status,
      if (submittedAt != $none) #submittedAt: submittedAt,
    }),
  );
  @override
  TrainingApplicationEntity $make(CopyWithData data) =>
      TrainingApplicationEntity(
        id: data.get(#id, or: $value.id),
        opportunityId: data.get(#opportunityId, or: $value.opportunityId),
        traineeId: data.get(#traineeId, or: $value.traineeId),
        fullName: data.get(#fullName, or: $value.fullName),
        university: data.get(#university, or: $value.university),
        faculty: data.get(#faculty, or: $value.faculty),
        city: data.get(#city, or: $value.city),
        graduationYear: data.get(#graduationYear, or: $value.graduationYear),
        cvUrl: data.get(#cvUrl, or: $value.cvUrl),
        status: data.get(#status, or: $value.status),
        submittedAt: data.get(#submittedAt, or: $value.submittedAt),
      );

  @override
  TrainingApplicationEntityCopyWith<$R2, TrainingApplicationEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TrainingApplicationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

