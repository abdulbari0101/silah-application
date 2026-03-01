// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_thread_entity.dart';

class ChatThreadEntityMapper extends ClassMapperBase<ChatThreadEntity> {
  ChatThreadEntityMapper._();

  static ChatThreadEntityMapper? _instance;
  static ChatThreadEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatThreadEntityMapper._());
      MessageEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatThreadEntity';

  static String? _$id(ChatThreadEntity v) => v.id;
  static const Field<ChatThreadEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static List<String>? _$participantIds(ChatThreadEntity v) => v.participantIds;
  static const Field<ChatThreadEntity, List<String>> _f$participantIds = Field(
    'participantIds',
    _$participantIds,
    opt: true,
  );
  static MessageEntity? _$lastMessage(ChatThreadEntity v) => v.lastMessage;
  static const Field<ChatThreadEntity, MessageEntity> _f$lastMessage = Field(
    'lastMessage',
    _$lastMessage,
    opt: true,
  );
  static int _$unreadCount(ChatThreadEntity v) => v.unreadCount;
  static const Field<ChatThreadEntity, int> _f$unreadCount = Field(
    'unreadCount',
    _$unreadCount,
    opt: true,
    def: 0,
  );
  static String? _$updatedAt(ChatThreadEntity v) => v.updatedAt;
  static const Field<ChatThreadEntity, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String? _$consultationId(ChatThreadEntity v) => v.consultationId;
  static const Field<ChatThreadEntity, String> _f$consultationId = Field(
    'consultationId',
    _$consultationId,
    opt: true,
  );

  @override
  final MappableFields<ChatThreadEntity> fields = const {
    #id: _f$id,
    #participantIds: _f$participantIds,
    #lastMessage: _f$lastMessage,
    #unreadCount: _f$unreadCount,
    #updatedAt: _f$updatedAt,
    #consultationId: _f$consultationId,
  };
  @override
  final bool ignoreNull = true;

  static ChatThreadEntity _instantiate(DecodingData data) {
    return ChatThreadEntity(
      id: data.dec(_f$id),
      participantIds: data.dec(_f$participantIds),
      lastMessage: data.dec(_f$lastMessage),
      unreadCount: data.dec(_f$unreadCount),
      updatedAt: data.dec(_f$updatedAt),
      consultationId: data.dec(_f$consultationId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatThreadEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatThreadEntity>(map);
  }

  static ChatThreadEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChatThreadEntity>(json);
  }
}

mixin ChatThreadEntityMappable {
  String toJsonString() {
    return ChatThreadEntityMapper.ensureInitialized()
        .encodeJson<ChatThreadEntity>(this as ChatThreadEntity);
  }

  Map<String, dynamic> toJson() {
    return ChatThreadEntityMapper.ensureInitialized()
        .encodeMap<ChatThreadEntity>(this as ChatThreadEntity);
  }

  ChatThreadEntityCopyWith<ChatThreadEntity, ChatThreadEntity, ChatThreadEntity>
  get copyWith =>
      _ChatThreadEntityCopyWithImpl<ChatThreadEntity, ChatThreadEntity>(
        this as ChatThreadEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatThreadEntityMapper.ensureInitialized().stringifyValue(
      this as ChatThreadEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatThreadEntityMapper.ensureInitialized().equalsValue(
      this as ChatThreadEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatThreadEntityMapper.ensureInitialized().hashValue(
      this as ChatThreadEntity,
    );
  }
}

extension ChatThreadEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatThreadEntity, $Out> {
  ChatThreadEntityCopyWith<$R, ChatThreadEntity, $Out>
  get $asChatThreadEntity =>
      $base.as((v, t, t2) => _ChatThreadEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatThreadEntityCopyWith<$R, $In extends ChatThreadEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get participantIds;
  MessageEntityCopyWith<$R, MessageEntity, MessageEntity>? get lastMessage;
  $R call({
    String? id,
    List<String>? participantIds,
    MessageEntity? lastMessage,
    int? unreadCount,
    String? updatedAt,
    String? consultationId,
  });
  ChatThreadEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatThreadEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatThreadEntity, $Out>
    implements ChatThreadEntityCopyWith<$R, ChatThreadEntity, $Out> {
  _ChatThreadEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatThreadEntity> $mapper =
      ChatThreadEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get participantIds => $value.participantIds != null
      ? ListCopyWith(
          $value.participantIds!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(participantIds: v),
        )
      : null;
  @override
  MessageEntityCopyWith<$R, MessageEntity, MessageEntity>? get lastMessage =>
      $value.lastMessage?.copyWith.$chain((v) => call(lastMessage: v));
  @override
  $R call({
    Object? id = $none,
    Object? participantIds = $none,
    Object? lastMessage = $none,
    int? unreadCount,
    Object? updatedAt = $none,
    Object? consultationId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (participantIds != $none) #participantIds: participantIds,
      if (lastMessage != $none) #lastMessage: lastMessage,
      if (unreadCount != null) #unreadCount: unreadCount,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (consultationId != $none) #consultationId: consultationId,
    }),
  );
  @override
  ChatThreadEntity $make(CopyWithData data) => ChatThreadEntity(
    id: data.get(#id, or: $value.id),
    participantIds: data.get(#participantIds, or: $value.participantIds),
    lastMessage: data.get(#lastMessage, or: $value.lastMessage),
    unreadCount: data.get(#unreadCount, or: $value.unreadCount),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    consultationId: data.get(#consultationId, or: $value.consultationId),
  );

  @override
  ChatThreadEntityCopyWith<$R2, ChatThreadEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatThreadEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

