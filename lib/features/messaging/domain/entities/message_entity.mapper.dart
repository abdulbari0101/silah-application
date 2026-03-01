// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message_entity.dart';

class MessageEntityMapper extends ClassMapperBase<MessageEntity> {
  MessageEntityMapper._();

  static MessageEntityMapper? _instance;
  static MessageEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageEntityMapper._());
      MessageTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MessageEntity';

  static String? _$id(MessageEntity v) => v.id;
  static const Field<MessageEntity, String> _f$id = Field(
    'id',
    _$id,
    opt: true,
  );
  static String? _$threadId(MessageEntity v) => v.threadId;
  static const Field<MessageEntity, String> _f$threadId = Field(
    'threadId',
    _$threadId,
    opt: true,
  );
  static String? _$senderId(MessageEntity v) => v.senderId;
  static const Field<MessageEntity, String> _f$senderId = Field(
    'senderId',
    _$senderId,
    opt: true,
  );
  static String? _$body(MessageEntity v) => v.body;
  static const Field<MessageEntity, String> _f$body = Field(
    'body',
    _$body,
    opt: true,
  );
  static MessageType _$type(MessageEntity v) => v.type;
  static const Field<MessageEntity, MessageType> _f$type = Field(
    'type',
    _$type,
    opt: true,
    def: MessageType.text,
  );
  static String? _$sentAt(MessageEntity v) => v.sentAt;
  static const Field<MessageEntity, String> _f$sentAt = Field(
    'sentAt',
    _$sentAt,
    opt: true,
  );
  static bool _$isRead(MessageEntity v) => v.isRead;
  static const Field<MessageEntity, bool> _f$isRead = Field(
    'isRead',
    _$isRead,
    opt: true,
    def: false,
  );
  static List<String>? _$attachmentUrls(MessageEntity v) => v.attachmentUrls;
  static const Field<MessageEntity, List<String>> _f$attachmentUrls = Field(
    'attachmentUrls',
    _$attachmentUrls,
    opt: true,
  );

  @override
  final MappableFields<MessageEntity> fields = const {
    #id: _f$id,
    #threadId: _f$threadId,
    #senderId: _f$senderId,
    #body: _f$body,
    #type: _f$type,
    #sentAt: _f$sentAt,
    #isRead: _f$isRead,
    #attachmentUrls: _f$attachmentUrls,
  };
  @override
  final bool ignoreNull = true;

  static MessageEntity _instantiate(DecodingData data) {
    return MessageEntity(
      id: data.dec(_f$id),
      threadId: data.dec(_f$threadId),
      senderId: data.dec(_f$senderId),
      body: data.dec(_f$body),
      type: data.dec(_f$type),
      sentAt: data.dec(_f$sentAt),
      isRead: data.dec(_f$isRead),
      attachmentUrls: data.dec(_f$attachmentUrls),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static MessageEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MessageEntity>(map);
  }

  static MessageEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<MessageEntity>(json);
  }
}

mixin MessageEntityMappable {
  String toJsonString() {
    return MessageEntityMapper.ensureInitialized().encodeJson<MessageEntity>(
      this as MessageEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return MessageEntityMapper.ensureInitialized().encodeMap<MessageEntity>(
      this as MessageEntity,
    );
  }

  MessageEntityCopyWith<MessageEntity, MessageEntity, MessageEntity>
  get copyWith => _MessageEntityCopyWithImpl<MessageEntity, MessageEntity>(
    this as MessageEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return MessageEntityMapper.ensureInitialized().stringifyValue(
      this as MessageEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return MessageEntityMapper.ensureInitialized().equalsValue(
      this as MessageEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return MessageEntityMapper.ensureInitialized().hashValue(
      this as MessageEntity,
    );
  }
}

extension MessageEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MessageEntity, $Out> {
  MessageEntityCopyWith<$R, MessageEntity, $Out> get $asMessageEntity =>
      $base.as((v, t, t2) => _MessageEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MessageEntityCopyWith<$R, $In extends MessageEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get attachmentUrls;
  $R call({
    String? id,
    String? threadId,
    String? senderId,
    String? body,
    MessageType? type,
    String? sentAt,
    bool? isRead,
    List<String>? attachmentUrls,
  });
  MessageEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MessageEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MessageEntity, $Out>
    implements MessageEntityCopyWith<$R, MessageEntity, $Out> {
  _MessageEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MessageEntity> $mapper =
      MessageEntityMapper.ensureInitialized();
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
    Object? threadId = $none,
    Object? senderId = $none,
    Object? body = $none,
    MessageType? type,
    Object? sentAt = $none,
    bool? isRead,
    Object? attachmentUrls = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (threadId != $none) #threadId: threadId,
      if (senderId != $none) #senderId: senderId,
      if (body != $none) #body: body,
      if (type != null) #type: type,
      if (sentAt != $none) #sentAt: sentAt,
      if (isRead != null) #isRead: isRead,
      if (attachmentUrls != $none) #attachmentUrls: attachmentUrls,
    }),
  );
  @override
  MessageEntity $make(CopyWithData data) => MessageEntity(
    id: data.get(#id, or: $value.id),
    threadId: data.get(#threadId, or: $value.threadId),
    senderId: data.get(#senderId, or: $value.senderId),
    body: data.get(#body, or: $value.body),
    type: data.get(#type, or: $value.type),
    sentAt: data.get(#sentAt, or: $value.sentAt),
    isRead: data.get(#isRead, or: $value.isRead),
    attachmentUrls: data.get(#attachmentUrls, or: $value.attachmentUrls),
  );

  @override
  MessageEntityCopyWith<$R2, MessageEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MessageEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

