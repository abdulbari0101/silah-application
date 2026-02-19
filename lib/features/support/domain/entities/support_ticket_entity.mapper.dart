// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'support_ticket_entity.dart';

class SupportTicketEntityMapper extends ClassMapperBase<SupportTicketEntity> {
  SupportTicketEntityMapper._();

  static SupportTicketEntityMapper? _instance;
  static SupportTicketEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SupportTicketEntityMapper._());
      SupportTicketStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SupportTicketEntity';

  static String? _$id(SupportTicketEntity v) => v.id;
  static const Field<SupportTicketEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$subject(SupportTicketEntity v) => v.subject;
  static const Field<SupportTicketEntity, String> _f$subject = Field(
    'subject',
    _$subject,
    opt: true,
  );
  static String? _$description(SupportTicketEntity v) => v.description;
  static const Field<SupportTicketEntity, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static SupportTicketStatus _$status(SupportTicketEntity v) => v.status;
  static const Field<SupportTicketEntity, SupportTicketStatus> _f$status =
      Field('status', _$status, opt: true, def: SupportTicketStatus.open);
  static List<String>? _$attachmentUrls(SupportTicketEntity v) =>
      v.attachmentUrls;
  static const Field<SupportTicketEntity, List<String>> _f$attachmentUrls =
      Field('attachmentUrls', _$attachmentUrls, opt: true);
  static String? _$createdAt(SupportTicketEntity v) => v.createdAt;
  static const Field<SupportTicketEntity, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static String? _$updatedAt(SupportTicketEntity v) => v.updatedAt;
  static const Field<SupportTicketEntity, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );

  @override
  final MappableFields<SupportTicketEntity> fields = const {
    #id: _f$id,
    #subject: _f$subject,
    #description: _f$description,
    #status: _f$status,
    #attachmentUrls: _f$attachmentUrls,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };
  @override
  final bool ignoreNull = true;

  static SupportTicketEntity _instantiate(DecodingData data) {
    return SupportTicketEntity(
      id: data.dec(_f$id),
      subject: data.dec(_f$subject),
      description: data.dec(_f$description),
      status: data.dec(_f$status),
      attachmentUrls: data.dec(_f$attachmentUrls),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SupportTicketEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SupportTicketEntity>(map);
  }

  static SupportTicketEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<SupportTicketEntity>(json);
  }
}

mixin SupportTicketEntityMappable {
  String toJsonString() {
    return SupportTicketEntityMapper.ensureInitialized()
        .encodeJson<SupportTicketEntity>(this as SupportTicketEntity);
  }

  Map<String, dynamic> toJson() {
    return SupportTicketEntityMapper.ensureInitialized()
        .encodeMap<SupportTicketEntity>(this as SupportTicketEntity);
  }

  SupportTicketEntityCopyWith<
    SupportTicketEntity,
    SupportTicketEntity,
    SupportTicketEntity
  >
  get copyWith =>
      _SupportTicketEntityCopyWithImpl<
        SupportTicketEntity,
        SupportTicketEntity
      >(this as SupportTicketEntity, $identity, $identity);
  @override
  String toString() {
    return SupportTicketEntityMapper.ensureInitialized().stringifyValue(
      this as SupportTicketEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return SupportTicketEntityMapper.ensureInitialized().equalsValue(
      this as SupportTicketEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return SupportTicketEntityMapper.ensureInitialized().hashValue(
      this as SupportTicketEntity,
    );
  }
}

extension SupportTicketEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SupportTicketEntity, $Out> {
  SupportTicketEntityCopyWith<$R, SupportTicketEntity, $Out>
  get $asSupportTicketEntity => $base.as(
    (v, t, t2) => _SupportTicketEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SupportTicketEntityCopyWith<
  $R,
  $In extends SupportTicketEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get attachmentUrls;
  $R call({
    String? id,
    String? subject,
    String? description,
    SupportTicketStatus? status,
    List<String>? attachmentUrls,
    String? createdAt,
    String? updatedAt,
  });
  SupportTicketEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SupportTicketEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SupportTicketEntity, $Out>
    implements SupportTicketEntityCopyWith<$R, SupportTicketEntity, $Out> {
  _SupportTicketEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SupportTicketEntity> $mapper =
      SupportTicketEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get attachmentUrls => $value.attachmentUrls != null
      ? ListCopyWith(
          $value.attachmentUrls!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(attachmentUrls: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? subject = $none,
    Object? description = $none,
    SupportTicketStatus? status,
    Object? attachmentUrls = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (subject != $none) #subject: subject,
      if (description != $none) #description: description,
      if (status != null) #status: status,
      if (attachmentUrls != $none) #attachmentUrls: attachmentUrls,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  SupportTicketEntity $make(CopyWithData data) => SupportTicketEntity(
    id: data.get(#id, or: $value.id),
    subject: data.get(#subject, or: $value.subject),
    description: data.get(#description, or: $value.description),
    status: data.get(#status, or: $value.status),
    attachmentUrls: data.get(#attachmentUrls, or: $value.attachmentUrls),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  SupportTicketEntityCopyWith<$R2, SupportTicketEntity, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SupportTicketEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

