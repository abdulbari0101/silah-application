// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_entity.dart';

class NotificationEntityMapper extends ClassMapperBase<NotificationEntity> {
  NotificationEntityMapper._();

  static NotificationEntityMapper? _instance;
  static NotificationEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationEntity';

  static String? _$id(NotificationEntity v) => v.id;
  static const Field<NotificationEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$type(NotificationEntity v) => v.type;
  static const Field<NotificationEntity, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$timestamp(NotificationEntity v) => v.timestamp;
  static const Field<NotificationEntity, String> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
  );
  static String? _$title(NotificationEntity v) => v.title;
  static const Field<NotificationEntity, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$message(NotificationEntity v) => v.message;
  static const Field<NotificationEntity, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static Map<String, dynamic>? _$data(NotificationEntity v) => v.data;
  static const Field<NotificationEntity, Map<String, dynamic>> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static bool _$isSeen(NotificationEntity v) => v.isSeen;
  static const Field<NotificationEntity, bool> _f$isSeen = Field(
    'isSeen',
    _$isSeen,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<NotificationEntity> fields = const {
    #id: _f$id,
    #type: _f$type,
    #timestamp: _f$timestamp,
    #title: _f$title,
    #message: _f$message,
    #data: _f$data,
    #isSeen: _f$isSeen,
  };
  @override
  final bool ignoreNull = true;

  static NotificationEntity _instantiate(DecodingData data) {
    return NotificationEntity(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      timestamp: data.dec(_f$timestamp),
      title: data.dec(_f$title),
      message: data.dec(_f$message),
      data: data.dec(_f$data),
      isSeen: data.dec(_f$isSeen),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationEntity>(map);
  }

  static NotificationEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationEntity>(json);
  }
}

mixin NotificationEntityMappable {
  String toJsonString() {
    return NotificationEntityMapper.ensureInitialized()
        .encodeJson<NotificationEntity>(this as NotificationEntity);
  }

  Map<String, dynamic> toJson() {
    return NotificationEntityMapper.ensureInitialized()
        .encodeMap<NotificationEntity>(this as NotificationEntity);
  }

  NotificationEntityCopyWith<
    NotificationEntity,
    NotificationEntity,
    NotificationEntity
  >
  get copyWith =>
      _NotificationEntityCopyWithImpl<NotificationEntity, NotificationEntity>(
        this as NotificationEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NotificationEntityMapper.ensureInitialized().stringifyValue(
      this as NotificationEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationEntityMapper.ensureInitialized().equalsValue(
      this as NotificationEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationEntityMapper.ensureInitialized().hashValue(
      this as NotificationEntity,
    );
  }
}

extension NotificationEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationEntity, $Out> {
  NotificationEntityCopyWith<$R, NotificationEntity, $Out>
  get $asNotificationEntity => $base.as(
    (v, t, t2) => _NotificationEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationEntityCopyWith<
  $R,
  $In extends NotificationEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get data;
  $R call({
    String? id,
    String? type,
    String? timestamp,
    String? title,
    String? message,
    Map<String, dynamic>? data,
    bool? isSeen,
  });
  NotificationEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationEntity, $Out>
    implements NotificationEntityCopyWith<$R, NotificationEntity, $Out> {
  _NotificationEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationEntity> $mapper =
      NotificationEntityMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
  get data => $value.data != null
      ? MapCopyWith(
          $value.data!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(data: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? type = $none,
    Object? timestamp = $none,
    Object? title = $none,
    Object? message = $none,
    Object? data = $none,
    bool? isSeen,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (type != $none) #type: type,
      if (timestamp != $none) #timestamp: timestamp,
      if (title != $none) #title: title,
      if (message != $none) #message: message,
      if (data != $none) #data: data,
      if (isSeen != null) #isSeen: isSeen,
    }),
  );
  @override
  NotificationEntity $make(CopyWithData data) => NotificationEntity(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    title: data.get(#title, or: $value.title),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    isSeen: data.get(#isSeen, or: $value.isSeen),
  );

  @override
  NotificationEntityCopyWith<$R2, NotificationEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

