// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'consultation_request_entity.dart';

class ConsultationRequestEntityMapper
    extends ClassMapperBase<ConsultationRequestEntity> {
  ConsultationRequestEntityMapper._();

  static ConsultationRequestEntityMapper? _instance;
  static ConsultationRequestEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = ConsultationRequestEntityMapper._(),
      );
      ConsultationStatusMapper.ensureInitialized();
      ConsultationCloseReasonMapper.ensureInitialized();
      CaseAttachmentEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ConsultationRequestEntity';

  static String? _$id(ConsultationRequestEntity v) => v.id;
  static const Field<ConsultationRequestEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$clientId(ConsultationRequestEntity v) => v.clientId;
  static const Field<ConsultationRequestEntity, String> _f$clientId = Field(
    'clientId',
    _$clientId,
    opt: true,
  );
  static String? _$lawyerId(ConsultationRequestEntity v) => v.lawyerId;
  static const Field<ConsultationRequestEntity, String> _f$lawyerId = Field(
    'lawyerId',
    _$lawyerId,
    opt: true,
  );
  static String? _$specializationId(ConsultationRequestEntity v) =>
      v.specializationId;
  static const Field<ConsultationRequestEntity, String> _f$specializationId =
      Field('specializationId', _$specializationId, opt: true);
  static String? _$description(ConsultationRequestEntity v) => v.description;
  static const Field<ConsultationRequestEntity, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static ConsultationStatus _$status(ConsultationRequestEntity v) => v.status;
  static const Field<ConsultationRequestEntity, ConsultationStatus> _f$status =
      Field('status', _$status, opt: true, def: ConsultationStatus.pending);
  static ConsultationCloseReason? _$closeReason(ConsultationRequestEntity v) =>
      v.closeReason;
  static const Field<ConsultationRequestEntity, ConsultationCloseReason>
  _f$closeReason = Field('closeReason', _$closeReason, opt: true);
  static List<CaseAttachmentEntity>? _$attachments(
    ConsultationRequestEntity v,
  ) => v.attachments;
  static const Field<ConsultationRequestEntity, List<CaseAttachmentEntity>>
  _f$attachments = Field('attachments', _$attachments, opt: true);
  static String? _$createdAt(ConsultationRequestEntity v) => v.createdAt;
  static const Field<ConsultationRequestEntity, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String? _$updatedAt(ConsultationRequestEntity v) => v.updatedAt;
  static const Field<ConsultationRequestEntity, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String? _$closedAt(ConsultationRequestEntity v) => v.closedAt;
  static const Field<ConsultationRequestEntity, String> _f$closedAt = Field(
    'closedAt',
    _$closedAt,
    opt: true,
  );

  @override
  final MappableFields<ConsultationRequestEntity> fields = const {
    #id: _f$id,
    #clientId: _f$clientId,
    #lawyerId: _f$lawyerId,
    #specializationId: _f$specializationId,
    #description: _f$description,
    #status: _f$status,
    #closeReason: _f$closeReason,
    #attachments: _f$attachments,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #closedAt: _f$closedAt,
  };
  @override
  final bool ignoreNull = true;

  static ConsultationRequestEntity _instantiate(DecodingData data) {
    return ConsultationRequestEntity(
      id: data.dec(_f$id),
      clientId: data.dec(_f$clientId),
      lawyerId: data.dec(_f$lawyerId),
      specializationId: data.dec(_f$specializationId),
      description: data.dec(_f$description),
      status: data.dec(_f$status),
      closeReason: data.dec(_f$closeReason),
      attachments: data.dec(_f$attachments),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      closedAt: data.dec(_f$closedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConsultationRequestEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConsultationRequestEntity>(map);
  }

  static ConsultationRequestEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ConsultationRequestEntity>(json);
  }
}

mixin ConsultationRequestEntityMappable {
  String toJsonString() {
    return ConsultationRequestEntityMapper.ensureInitialized()
        .encodeJson<ConsultationRequestEntity>(
          this as ConsultationRequestEntity,
        );
  }

  Map<String, dynamic> toJson() {
    return ConsultationRequestEntityMapper.ensureInitialized()
        .encodeMap<ConsultationRequestEntity>(
          this as ConsultationRequestEntity,
        );
  }

  ConsultationRequestEntityCopyWith<
    ConsultationRequestEntity,
    ConsultationRequestEntity,
    ConsultationRequestEntity
  >
  get copyWith =>
      _ConsultationRequestEntityCopyWithImpl<
        ConsultationRequestEntity,
        ConsultationRequestEntity
      >(this as ConsultationRequestEntity, $identity, $identity);
  @override
  String toString() {
    return ConsultationRequestEntityMapper.ensureInitialized().stringifyValue(
      this as ConsultationRequestEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ConsultationRequestEntityMapper.ensureInitialized().equalsValue(
      this as ConsultationRequestEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ConsultationRequestEntityMapper.ensureInitialized().hashValue(
      this as ConsultationRequestEntity,
    );
  }
}

extension ConsultationRequestEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConsultationRequestEntity, $Out> {
  ConsultationRequestEntityCopyWith<$R, ConsultationRequestEntity, $Out>
  get $asConsultationRequestEntity => $base.as(
    (v, t, t2) => _ConsultationRequestEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConsultationRequestEntityCopyWith<
  $R,
  $In extends ConsultationRequestEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    CaseAttachmentEntity,
    CaseAttachmentEntityCopyWith<$R, CaseAttachmentEntity, CaseAttachmentEntity>
  >?
  get attachments;
  $R call({
    String? id,
    String? clientId,
    String? lawyerId,
    String? specializationId,
    String? description,
    ConsultationStatus? status,
    ConsultationCloseReason? closeReason,
    List<CaseAttachmentEntity>? attachments,
    String? createdAt,
    String? updatedAt,
    String? closedAt,
  });
  ConsultationRequestEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ConsultationRequestEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConsultationRequestEntity, $Out>
    implements
        ConsultationRequestEntityCopyWith<$R, ConsultationRequestEntity, $Out> {
  _ConsultationRequestEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConsultationRequestEntity> $mapper =
      ConsultationRequestEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    CaseAttachmentEntity,
    CaseAttachmentEntityCopyWith<$R, CaseAttachmentEntity, CaseAttachmentEntity>
  >?
  get attachments => $value.attachments != null
      ? ListCopyWith(
          $value.attachments!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(attachments: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? clientId = $none,
    Object? lawyerId = $none,
    Object? specializationId = $none,
    Object? description = $none,
    ConsultationStatus? status,
    Object? closeReason = $none,
    Object? attachments = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? closedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (clientId != $none) #clientId: clientId,
      if (lawyerId != $none) #lawyerId: lawyerId,
      if (specializationId != $none) #specializationId: specializationId,
      if (description != $none) #description: description,
      if (status != null) #status: status,
      if (closeReason != $none) #closeReason: closeReason,
      if (attachments != $none) #attachments: attachments,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (closedAt != $none) #closedAt: closedAt,
    }),
  );
  @override
  ConsultationRequestEntity $make(CopyWithData data) =>
      ConsultationRequestEntity(
        id: data.get(#id, or: $value.id),
        clientId: data.get(#clientId, or: $value.clientId),
        lawyerId: data.get(#lawyerId, or: $value.lawyerId),
        specializationId: data.get(
          #specializationId,
          or: $value.specializationId,
        ),
        description: data.get(#description, or: $value.description),
        status: data.get(#status, or: $value.status),
        closeReason: data.get(#closeReason, or: $value.closeReason),
        attachments: data.get(#attachments, or: $value.attachments),
        createdAt: data.get(#createdAt, or: $value.createdAt),
        updatedAt: data.get(#updatedAt, or: $value.updatedAt),
        closedAt: data.get(#closedAt, or: $value.closedAt),
      );

  @override
  ConsultationRequestEntityCopyWith<$R2, ConsultationRequestEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConsultationRequestEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

