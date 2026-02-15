// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification_group.dart';

class NotificationGroupMapper extends ClassMapperBase<NotificationGroup> {
  NotificationGroupMapper._();

  static NotificationGroupMapper? _instance;
  static NotificationGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationGroupMapper._());
      NotificationEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationGroup';

  static String _$headerDate(NotificationGroup v) => v.headerDate;
  static const Field<NotificationGroup, String> _f$headerDate = Field(
    'headerDate',
    _$headerDate,
  );
  static List<NotificationEntity>? _$notifications(NotificationGroup v) =>
      v.notifications;
  static const Field<NotificationGroup, List<NotificationEntity>>
  _f$notifications = Field('notifications', _$notifications, opt: true);

  @override
  final MappableFields<NotificationGroup> fields = const {
    #headerDate: _f$headerDate,
    #notifications: _f$notifications,
  };
  @override
  final bool ignoreNull = true;

  static NotificationGroup _instantiate(DecodingData data) {
    return NotificationGroup(
      headerDate: data.dec(_f$headerDate),
      notifications: data.dec(_f$notifications),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationGroup fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationGroup>(map);
  }

  static NotificationGroup fromJsonString(String json) {
    return ensureInitialized().decodeJson<NotificationGroup>(json);
  }
}

mixin NotificationGroupMappable {
  String toJsonString() {
    return NotificationGroupMapper.ensureInitialized()
        .encodeJson<NotificationGroup>(this as NotificationGroup);
  }

  Map<String, dynamic> toJson() {
    return NotificationGroupMapper.ensureInitialized()
        .encodeMap<NotificationGroup>(this as NotificationGroup);
  }

  NotificationGroupCopyWith<
    NotificationGroup,
    NotificationGroup,
    NotificationGroup
  >
  get copyWith =>
      _NotificationGroupCopyWithImpl<NotificationGroup, NotificationGroup>(
        this as NotificationGroup,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NotificationGroupMapper.ensureInitialized().stringifyValue(
      this as NotificationGroup,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationGroupMapper.ensureInitialized().equalsValue(
      this as NotificationGroup,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationGroupMapper.ensureInitialized().hashValue(
      this as NotificationGroup,
    );
  }
}

extension NotificationGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationGroup, $Out> {
  NotificationGroupCopyWith<$R, NotificationGroup, $Out>
  get $asNotificationGroup => $base.as(
    (v, t, t2) => _NotificationGroupCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationGroupCopyWith<
  $R,
  $In extends NotificationGroup,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    NotificationEntity,
    NotificationEntityCopyWith<$R, NotificationEntity, NotificationEntity>
  >?
  get notifications;
  $R call({String? headerDate, List<NotificationEntity>? notifications});
  NotificationGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationGroup, $Out>
    implements NotificationGroupCopyWith<$R, NotificationGroup, $Out> {
  _NotificationGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationGroup> $mapper =
      NotificationGroupMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    NotificationEntity,
    NotificationEntityCopyWith<$R, NotificationEntity, NotificationEntity>
  >?
  get notifications => $value.notifications != null
      ? ListCopyWith(
          $value.notifications!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(notifications: v),
        )
      : null;
  @override
  $R call({String? headerDate, Object? notifications = $none}) => $apply(
    FieldCopyWithData({
      if (headerDate != null) #headerDate: headerDate,
      if (notifications != $none) #notifications: notifications,
    }),
  );
  @override
  NotificationGroup $make(CopyWithData data) => NotificationGroup(
    headerDate: data.get(#headerDate, or: $value.headerDate),
    notifications: data.get(#notifications, or: $value.notifications),
  );

  @override
  NotificationGroupCopyWith<$R2, NotificationGroup, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationGroupCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

