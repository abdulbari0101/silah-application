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

  static String? _$id(NotificationModel v) => v.id;
  static const Field<NotificationModel, String> _f$id = Field(
    'id',
    _$id,
    key: r'notificationId',
    opt: true,
  );
  static String? _$type(NotificationModel v) => v.type;
  static const Field<NotificationModel, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$timestamp(NotificationModel v) => v.timestamp;
  static const Field<NotificationModel, String> _f$timestamp = Field(
    'timestamp',
    _$timestamp,
    opt: true,
  );
  static String? _$title(NotificationModel v) => v.title;
  static const Field<NotificationModel, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );
  static String? _$message(NotificationModel v) => v.message;
  static const Field<NotificationModel, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );
  static Map<String, dynamic>? _$data(NotificationModel v) => v.data;
  static const Field<NotificationModel, Map<String, dynamic>> _f$data = Field(
    'data',
    _$data,
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

  static NotificationModel _instantiate(DecodingData data) {
    return NotificationModel(
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
  NotificationModel $make(CopyWithData data) => NotificationModel(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    timestamp: data.get(#timestamp, or: $value.timestamp),
    title: data.get(#title, or: $value.title),
    message: data.get(#message, or: $value.message),
    data: data.get(#data, or: $value.data),
    isSeen: data.get(#isSeen, or: $value.isSeen),
  );

  @override
  NotificationModelCopyWith<$R2, NotificationModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NotificationsResponseModelMapper
    extends ClassMapperBase<NotificationsResponseModel> {
  NotificationsResponseModelMapper._();

  static NotificationsResponseModelMapper? _instance;
  static NotificationsResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = NotificationsResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
      NotificationModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationsResponseModel';

  static ResultModel? _$result(NotificationsResponseModel v) => v.result;
  static const Field<NotificationsResponseModel, ResultModel> _f$result = Field(
    'result',
    _$result,
    key: r'Result',
  );
  static List<NotificationModel>? _$notifications(
    NotificationsResponseModel v,
  ) => v.notifications;
  static const Field<NotificationsResponseModel, List<NotificationModel>>
  _f$notifications = Field('notifications', _$notifications, opt: true);
  static int? _$unSeenCount(NotificationsResponseModel v) => v.unSeenCount;
  static const Field<NotificationsResponseModel, int> _f$unSeenCount = Field(
    'unSeenCount',
    _$unSeenCount,
    opt: true,
  );

  @override
  final MappableFields<NotificationsResponseModel> fields = const {
    #result: _f$result,
    #notifications: _f$notifications,
    #unSeenCount: _f$unSeenCount,
  };
  @override
  final bool ignoreNull = true;

  static NotificationsResponseModel _instantiate(DecodingData data) {
    return NotificationsResponseModel(
      result: data.dec(_f$result),
      notifications: data.dec(_f$notifications),
      unSeenCount: data.dec(_f$unSeenCount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationsResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationsResponseModel>(map);
  }

  static NotificationsResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationsResponseModel>(json);
  }
}

mixin NotificationsResponseModelMappable {
  String toJsonString() {
    return NotificationsResponseModelMapper.ensureInitialized()
        .encodeJson<NotificationsResponseModel>(
          this as NotificationsResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return NotificationsResponseModelMapper.ensureInitialized()
        .encodeMap<NotificationsResponseModel>(
          this as NotificationsResponseModel,
        );
  }

  NotificationsResponseModelCopyWith<
    NotificationsResponseModel,
    NotificationsResponseModel,
    NotificationsResponseModel
  >
  get copyWith =>
      _NotificationsResponseModelCopyWithImpl<
        NotificationsResponseModel,
        NotificationsResponseModel
      >(this as NotificationsResponseModel, $identity, $identity);
  @override
  String toString() {
    return NotificationsResponseModelMapper.ensureInitialized().stringifyValue(
      this as NotificationsResponseModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationsResponseModelMapper.ensureInitialized().equalsValue(
      this as NotificationsResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationsResponseModelMapper.ensureInitialized().hashValue(
      this as NotificationsResponseModel,
    );
  }
}

extension NotificationsResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationsResponseModel, $Out> {
  NotificationsResponseModelCopyWith<$R, NotificationsResponseModel, $Out>
  get $asNotificationsResponseModel => $base.as(
    (v, t, t2) => _NotificationsResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationsResponseModelCopyWith<
  $R,
  $In extends NotificationsResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  ListCopyWith<
    $R,
    NotificationModel,
    NotificationModelCopyWith<$R, NotificationModel, NotificationModel>
  >?
  get notifications;
  @override
  $R call({
    ResultModel? result,
    List<NotificationModel>? notifications,
    int? unSeenCount,
  });
  NotificationsResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationsResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationsResponseModel, $Out>
    implements
        NotificationsResponseModelCopyWith<
          $R,
          NotificationsResponseModel,
          $Out
        > {
  _NotificationsResponseModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationsResponseModel> $mapper =
      NotificationsResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  ListCopyWith<
    $R,
    NotificationModel,
    NotificationModelCopyWith<$R, NotificationModel, NotificationModel>
  >?
  get notifications => $value.notifications != null
      ? ListCopyWith(
          $value.notifications!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(notifications: v),
        )
      : null;
  @override
  $R call({
    Object? result = $none,
    Object? notifications = $none,
    Object? unSeenCount = $none,
  }) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (notifications != $none) #notifications: notifications,
      if (unSeenCount != $none) #unSeenCount: unSeenCount,
    }),
  );
  @override
  NotificationsResponseModel $make(CopyWithData data) =>
      NotificationsResponseModel(
        result: data.get(#result, or: $value.result),
        notifications: data.get(#notifications, or: $value.notifications),
        unSeenCount: data.get(#unSeenCount, or: $value.unSeenCount),
      );

  @override
  NotificationsResponseModelCopyWith<$R2, NotificationsResponseModel, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NotificationsResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NotificationsSeenResponseModelMapper
    extends ClassMapperBase<NotificationsSeenResponseModel> {
  NotificationsSeenResponseModelMapper._();

  static NotificationsSeenResponseModelMapper? _instance;
  static NotificationsSeenResponseModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = NotificationsSeenResponseModelMapper._(),
      );
      BaseRespWrapperMapper.ensureInitialized();
      ResultModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationsSeenResponseModel';

  static ResultModel? _$result(NotificationsSeenResponseModel v) => v.result;
  static const Field<NotificationsSeenResponseModel, ResultModel> _f$result =
      Field('result', _$result, key: r'Result');
  static int? _$updatedCount(NotificationsSeenResponseModel v) =>
      v.updatedCount;
  static const Field<NotificationsSeenResponseModel, int> _f$updatedCount =
      Field('updatedCount', _$updatedCount, opt: true);

  @override
  final MappableFields<NotificationsSeenResponseModel> fields = const {
    #result: _f$result,
    #updatedCount: _f$updatedCount,
  };
  @override
  final bool ignoreNull = true;

  static NotificationsSeenResponseModel _instantiate(DecodingData data) {
    return NotificationsSeenResponseModel(
      result: data.dec(_f$result),
      updatedCount: data.dec(_f$updatedCount),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationsSeenResponseModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationsSeenResponseModel>(map);
  }

  static NotificationsSeenResponseModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationsSeenResponseModel>(json);
  }
}

mixin NotificationsSeenResponseModelMappable {
  String toJsonString() {
    return NotificationsSeenResponseModelMapper.ensureInitialized()
        .encodeJson<NotificationsSeenResponseModel>(
          this as NotificationsSeenResponseModel,
        );
  }

  Map<String, dynamic> toJson() {
    return NotificationsSeenResponseModelMapper.ensureInitialized()
        .encodeMap<NotificationsSeenResponseModel>(
          this as NotificationsSeenResponseModel,
        );
  }

  NotificationsSeenResponseModelCopyWith<
    NotificationsSeenResponseModel,
    NotificationsSeenResponseModel,
    NotificationsSeenResponseModel
  >
  get copyWith =>
      _NotificationsSeenResponseModelCopyWithImpl<
        NotificationsSeenResponseModel,
        NotificationsSeenResponseModel
      >(this as NotificationsSeenResponseModel, $identity, $identity);
  @override
  String toString() {
    return NotificationsSeenResponseModelMapper.ensureInitialized()
        .stringifyValue(this as NotificationsSeenResponseModel);
  }

  @override
  bool operator ==(Object other) {
    return NotificationsSeenResponseModelMapper.ensureInitialized().equalsValue(
      this as NotificationsSeenResponseModel,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationsSeenResponseModelMapper.ensureInitialized().hashValue(
      this as NotificationsSeenResponseModel,
    );
  }
}

extension NotificationsSeenResponseModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationsSeenResponseModel, $Out> {
  NotificationsSeenResponseModelCopyWith<
    $R,
    NotificationsSeenResponseModel,
    $Out
  >
  get $asNotificationsSeenResponseModel => $base.as(
    (v, t, t2) =>
        _NotificationsSeenResponseModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationsSeenResponseModelCopyWith<
  $R,
  $In extends NotificationsSeenResponseModel,
  $Out
>
    implements BaseRespWrapperCopyWith<$R, $In, $Out> {
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result;
  @override
  $R call({ResultModel? result, int? updatedCount});
  NotificationsSeenResponseModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationsSeenResponseModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationsSeenResponseModel, $Out>
    implements
        NotificationsSeenResponseModelCopyWith<
          $R,
          NotificationsSeenResponseModel,
          $Out
        > {
  _NotificationsSeenResponseModelCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<NotificationsSeenResponseModel> $mapper =
      NotificationsSeenResponseModelMapper.ensureInitialized();
  @override
  ResultModelCopyWith<$R, ResultModel, ResultModel>? get result =>
      $value.result?.copyWith.$chain((v) => call(result: v));
  @override
  $R call({Object? result = $none, Object? updatedCount = $none}) => $apply(
    FieldCopyWithData({
      if (result != $none) #result: result,
      if (updatedCount != $none) #updatedCount: updatedCount,
    }),
  );
  @override
  NotificationsSeenResponseModel $make(CopyWithData data) =>
      NotificationsSeenResponseModel(
        result: data.get(#result, or: $value.result),
        updatedCount: data.get(#updatedCount, or: $value.updatedCount),
      );

  @override
  NotificationsSeenResponseModelCopyWith<
    $R2,
    NotificationsSeenResponseModel,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NotificationsSeenResponseModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

