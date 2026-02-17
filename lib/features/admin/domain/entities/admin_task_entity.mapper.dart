// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'admin_task_entity.dart';

class AdminTaskEntityMapper extends ClassMapperBase<AdminTaskEntity> {
  AdminTaskEntityMapper._();

  static AdminTaskEntityMapper? _instance;
  static AdminTaskEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdminTaskEntityMapper._());
      AdminTaskStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdminTaskEntity';

  static String? _$id(AdminTaskEntity v) => v.id;
  static const Field<AdminTaskEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$type(AdminTaskEntity v) => v.type;
  static const Field<AdminTaskEntity, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$targetId(AdminTaskEntity v) => v.targetId;
  static const Field<AdminTaskEntity, String> _f$targetId = Field(
    'targetId',
    _$targetId,
    opt: true,
  );
  static AdminTaskStatus _$status(AdminTaskEntity v) => v.status;
  static const Field<AdminTaskEntity, AdminTaskStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: AdminTaskStatus.pending,
  );
  static String? _$notes(AdminTaskEntity v) => v.notes;
  static const Field<AdminTaskEntity, String> _f$notes = Field(
    'notes',
    _$notes,
    opt: true,
  );
  static String? _$createdAt(AdminTaskEntity v) => v.createdAt;
  static const Field<AdminTaskEntity, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );

  @override
  final MappableFields<AdminTaskEntity> fields = const {
    #id: _f$id,
    #type: _f$type,
    #targetId: _f$targetId,
    #status: _f$status,
    #notes: _f$notes,
    #createdAt: _f$createdAt,
  };
  @override
  final bool ignoreNull = true;

  static AdminTaskEntity _instantiate(DecodingData data) {
    return AdminTaskEntity(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      targetId: data.dec(_f$targetId),
      status: data.dec(_f$status),
      notes: data.dec(_f$notes),
      createdAt: data.dec(_f$createdAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AdminTaskEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdminTaskEntity>(map);
  }

  static AdminTaskEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<AdminTaskEntity>(json);
  }
}

mixin AdminTaskEntityMappable {
  String toJsonString() {
    return AdminTaskEntityMapper.ensureInitialized()
        .encodeJson<AdminTaskEntity>(this as AdminTaskEntity);
  }

  Map<String, dynamic> toJson() {
    return AdminTaskEntityMapper.ensureInitialized().encodeMap<AdminTaskEntity>(
      this as AdminTaskEntity,
    );
  }

  AdminTaskEntityCopyWith<AdminTaskEntity, AdminTaskEntity, AdminTaskEntity>
  get copyWith =>
      _AdminTaskEntityCopyWithImpl<AdminTaskEntity, AdminTaskEntity>(
        this as AdminTaskEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AdminTaskEntityMapper.ensureInitialized().stringifyValue(
      this as AdminTaskEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return AdminTaskEntityMapper.ensureInitialized().equalsValue(
      this as AdminTaskEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return AdminTaskEntityMapper.ensureInitialized().hashValue(
      this as AdminTaskEntity,
    );
  }
}

extension AdminTaskEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdminTaskEntity, $Out> {
  AdminTaskEntityCopyWith<$R, AdminTaskEntity, $Out> get $asAdminTaskEntity =>
      $base.as((v, t, t2) => _AdminTaskEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AdminTaskEntityCopyWith<$R, $In extends AdminTaskEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? type,
    String? targetId,
    AdminTaskStatus? status,
    String? notes,
    String? createdAt,
  });
  AdminTaskEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AdminTaskEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdminTaskEntity, $Out>
    implements AdminTaskEntityCopyWith<$R, AdminTaskEntity, $Out> {
  _AdminTaskEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdminTaskEntity> $mapper =
      AdminTaskEntityMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? type = $none,
    Object? targetId = $none,
    AdminTaskStatus? status,
    Object? notes = $none,
    Object? createdAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (type != $none) #type: type,
      if (targetId != $none) #targetId: targetId,
      if (status != null) #status: status,
      if (notes != $none) #notes: notes,
      if (createdAt != $none) #createdAt: createdAt,
    }),
  );
  @override
  AdminTaskEntity $make(CopyWithData data) => AdminTaskEntity(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    targetId: data.get(#targetId, or: $value.targetId),
    status: data.get(#status, or: $value.status),
    notes: data.get(#notes, or: $value.notes),
    createdAt: data.get(#createdAt, or: $value.createdAt),
  );

  @override
  AdminTaskEntityCopyWith<$R2, AdminTaskEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AdminTaskEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

