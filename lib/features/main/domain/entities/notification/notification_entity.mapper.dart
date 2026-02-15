// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
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

  static String? _$timestamp(NotificationEntity v) => v.timestamp;
  static const Field<NotificationEntity, String> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
  );
  static int? _$serviceNo(NotificationEntity v) => v.serviceNo;
  static const Field<NotificationEntity, int> _f$serviceNo = Field(
    'serviceNo',
    _$serviceNo,
    opt: true,
  );
  static String? _$operationName(NotificationEntity v) => v.operationName;
  static const Field<NotificationEntity, String> _f$operationName = Field(
    'operationName',
    _$operationName,
    opt: true,
  );
  static int? _$languageCode(NotificationEntity v) => v.languageCode;
  static const Field<NotificationEntity, int> _f$languageCode = Field(
    'languageCode',
    _$languageCode,
    opt: true,
  );
  static String? _$message(NotificationEntity v) => v.message;
  static const Field<NotificationEntity, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static int? _$id(NotificationEntity v) => v.id;
  static const Field<NotificationEntity, int> _f$id = Field(
    'id',
    _$id,
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
    #timestamp: _f$timestamp,
    #serviceNo: _f$serviceNo,
    #operationName: _f$operationName,
    #languageCode: _f$languageCode,
    #message: _f$message,
    #id: _f$id,
    #isSeen: _f$isSeen,
  };
  @override
  final bool ignoreNull = true;

  static NotificationEntity _instantiate(DecodingData data) {
    return NotificationEntity(
      timestamp: data.dec(_f$timestamp),
      serviceNo: data.dec(_f$serviceNo),
      operationName: data.dec(_f$operationName),
      languageCode: data.dec(_f$languageCode),
      message: data.dec(_f$message),
      id: data.dec(_f$id),
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
  $R call({
    String? timestamp,
    int? serviceNo,
    String? operationName,
    int? languageCode,
    String? message,
    int? id,
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
  $R call({
    Object? timestamp = $none,
    Object? serviceNo = $none,
    Object? operationName = $none,
    Object? languageCode = $none,
    Object? message = $none,
    Object? id = $none,
    bool? isSeen,
  }) => $apply(
    FieldCopyWithData({
      if (timestamp != $none) #timestamp: timestamp,
      if (serviceNo != $none) #serviceNo: serviceNo,
      if (operationName != $none) #operationName: operationName,
      if (languageCode != $none) #languageCode: languageCode,
      if (message != $none) #message: message,
      if (id != $none) #id: id,
      if (isSeen != null) #isSeen: isSeen,
    }),
  );
  @override
  NotificationEntity $make(CopyWithData data) => NotificationEntity(
    timestamp: data.get(#timestamp, or: $value.timestamp),
    serviceNo: data.get(#serviceNo, or: $value.serviceNo),
    operationName: data.get(#operationName, or: $value.operationName),
    languageCode: data.get(#languageCode, or: $value.languageCode),
    message: data.get(#message, or: $value.message),
    id: data.get(#id, or: $value.id),
    isSeen: data.get(#isSeen, or: $value.isSeen),
  );

  @override
  NotificationEntityCopyWith<$R2, NotificationEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

