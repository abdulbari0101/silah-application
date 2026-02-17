// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_model.dart';

class NotificationModelMapper extends ClassMapperBase<NotificationModel> {
  NotificationModelMapper._();

  static NotificationModelMapper? _instance;
  static NotificationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationModel';

  static String? _$timestamp(NotificationModel v) => v.timestamp;
  static const Field<NotificationModel, String> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    key: r'DATEIN',
    opt: true,
  );
  static int? _$serviceNo(NotificationModel v) => v.serviceNo;
  static const Field<NotificationModel, int> _f$serviceNo = Field(
    'serviceNo',
    _$serviceNo,
    key: r'SERVICENO',
    opt: true,
  );
  static int? _$languageCode(NotificationModel v) => v.languageCode;
  static const Field<NotificationModel, int> _f$languageCode = Field(
    'languageCode',
    _$languageCode,
    key: r'LANGNO',
    opt: true,
  );
  static String? _$message(NotificationModel v) => v.message;
  static const Field<NotificationModel, String> _f$message = Field(
    'message',
    _$message,
    key: r'MESSAGE',
    opt: true,
  );
  static int? _$id(NotificationModel v) => v.id;
  static const Field<NotificationModel, int> _f$id = Field(
    'id',
    _$id,
    key: r'local_id',
    opt: true,
  );
  static String? _$userId(NotificationModel v) => v.userId;
  static const Field<NotificationModel, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'local_user_id',
    opt: true,
  );
  static bool _$isSeen(NotificationModel v) => v.isSeen;
  static const Field<NotificationModel, bool> _f$isSeen = Field(
    'isSeen',
    _$isSeen,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<NotificationModel> fields = const {
    #timestamp: _f$timestamp,
    #serviceNo: _f$serviceNo,
    #languageCode: _f$languageCode,
    #message: _f$message,
    #id: _f$id,
    #userId: _f$userId,
    #isSeen: _f$isSeen,
  };
  @override
  final bool ignoreNull = true;

  static NotificationModel _instantiate(DecodingData data) {
    return NotificationModel(
      timestamp: data.dec(_f$timestamp),
      serviceNo: data.dec(_f$serviceNo),
      languageCode: data.dec(_f$languageCode),
      message: data.dec(_f$message),
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      isSeen: data.dec(_f$isSeen),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationModel>(map);
  }

  static NotificationModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationModel>(json);
  }
}

mixin NotificationModelMappable {
  String toJsonString() {
    return NotificationModelMapper.ensureInitialized()
        .encodeJson<NotificationModel>(this as NotificationModel);
  }

  Map<String, dynamic> toJson() {
    return NotificationModelMapper.ensureInitialized()
        .encodeMap<NotificationModel>(this as NotificationModel);
  }

  NotificationModelCopyWith<
    NotificationModel,
    NotificationModel,
    NotificationModel
  >
  get copyWith =>
      _NotificationModelCopyWithImpl<NotificationModel, NotificationModel>(
        this as NotificationModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NotificationModelMapper.ensureInitialized().stringifyValue(
      this as NotificationModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationModelMapper.ensureInitialized().equalsValue(
      this as NotificationModel,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationModelMapper.ensureInitialized().hashValue(
      this as NotificationModel,
    );
  }
}

extension NotificationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationModel, $Out> {
  NotificationModelCopyWith<$R, NotificationModel, $Out>
  get $asNotificationModel => $base.as(
    (v, t, t2) => _NotificationModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationModelCopyWith<
  $R,
  $In extends NotificationModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? timestamp,
    int? serviceNo,
    int? languageCode,
    String? message,
    int? id,
    String? userId,
    bool? isSeen,
  });
  NotificationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationModel, $Out>
    implements NotificationModelCopyWith<$R, NotificationModel, $Out> {
  _NotificationModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationModel> $mapper =
      NotificationModelMapper.ensureInitialized();
  @override
  $R call({
    Object? timestamp = $none,
    Object? serviceNo = $none,
    Object? languageCode = $none,
    Object? message = $none,
    Object? id = $none,
    Object? userId = $none,
    bool? isSeen,
  }) => $apply(
    FieldCopyWithData({
      if (timestamp != $none) #timestamp: timestamp,
      if (serviceNo != $none) #serviceNo: serviceNo,
      if (languageCode != $none) #languageCode: languageCode,
      if (message != $none) #message: message,
      if (id != $none) #id: id,
      if (userId != $none) #userId: userId,
      if (isSeen != null) #isSeen: isSeen,
    }),
  );
  @override
  NotificationModel $make(CopyWithData data) => NotificationModel(
    timestamp: data.get(#timestamp, or: $value.timestamp),
    serviceNo: data.get(#serviceNo, or: $value.serviceNo),
    languageCode: data.get(#languageCode, or: $value.languageCode),
    message: data.get(#message, or: $value.message),
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    isSeen: data.get(#isSeen, or: $value.isSeen),
  );

  @override
  NotificationModelCopyWith<$R2, NotificationModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

