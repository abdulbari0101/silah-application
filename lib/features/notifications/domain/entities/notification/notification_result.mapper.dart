// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_result.dart';

class NotificationResultMapper extends ClassMapperBase<NotificationResult> {
  NotificationResultMapper._();

  static NotificationResultMapper? _instance;
  static NotificationResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationResultMapper._());
      NotificationEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationResult';

  static int _$unSeenCount(NotificationResult v) => v.unSeenCount;
  static const Field<NotificationResult, int> _f$unSeenCount = Field(
    'unSeenCount',
    _$unSeenCount,
  );
  static List<NotificationEntity> _$notifications(NotificationResult v) =>
      v.notifications;
  static const Field<NotificationResult, List<NotificationEntity>>
  _f$notifications = Field('notifications', _$notifications);

  @override
  final MappableFields<NotificationResult> fields = const {
    #unSeenCount: _f$unSeenCount,
    #notifications: _f$notifications,
  };
  @override
  final bool ignoreNull = true;

  static NotificationResult _instantiate(DecodingData data) {
    return NotificationResult(
      unSeenCount: data.dec(_f$unSeenCount),
      notifications: data.dec(_f$notifications),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationResult fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationResult>(map);
  }

  static NotificationResult fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationResult>(json);
  }
}

mixin NotificationResultMappable {
  String toJsonString() {
    return NotificationResultMapper.ensureInitialized()
        .encodeJson<NotificationResult>(this as NotificationResult);
  }

  Map<String, dynamic> toJson() {
    return NotificationResultMapper.ensureInitialized()
        .encodeMap<NotificationResult>(this as NotificationResult);
  }

  NotificationResultCopyWith<
    NotificationResult,
    NotificationResult,
    NotificationResult
  >
  get copyWith =>
      _NotificationResultCopyWithImpl<NotificationResult, NotificationResult>(
        this as NotificationResult,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NotificationResultMapper.ensureInitialized().stringifyValue(
      this as NotificationResult,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationResultMapper.ensureInitialized().equalsValue(
      this as NotificationResult,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationResultMapper.ensureInitialized().hashValue(
      this as NotificationResult,
    );
  }
}

extension NotificationResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationResult, $Out> {
  NotificationResultCopyWith<$R, NotificationResult, $Out>
  get $asNotificationResult => $base.as(
    (v, t, t2) => _NotificationResultCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationResultCopyWith<
  $R,
  $In extends NotificationResult,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    NotificationEntity,
    NotificationEntityCopyWith<$R, NotificationEntity, NotificationEntity>
  >
  get notifications;
  $R call({int? unSeenCount, List<NotificationEntity>? notifications});
  NotificationResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationResult, $Out>
    implements NotificationResultCopyWith<$R, NotificationResult, $Out> {
  _NotificationResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationResult> $mapper =
      NotificationResultMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    NotificationEntity,
    NotificationEntityCopyWith<$R, NotificationEntity, NotificationEntity>
  >
  get notifications => ListCopyWith(
    $value.notifications,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(notifications: v),
  );
  @override
  $R call({int? unSeenCount, List<NotificationEntity>? notifications}) =>
      $apply(
        FieldCopyWithData({
          if (unSeenCount != null) #unSeenCount: unSeenCount,
          if (notifications != null) #notifications: notifications,
        }),
      );
  @override
  NotificationResult $make(CopyWithData data) => NotificationResult(
    unSeenCount: data.get(#unSeenCount, or: $value.unSeenCount),
    notifications: data.get(#notifications, or: $value.notifications),
  );

  @override
  NotificationResultCopyWith<$R2, NotificationResult, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationResultCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

