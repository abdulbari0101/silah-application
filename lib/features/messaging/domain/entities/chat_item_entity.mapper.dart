// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_item_entity.dart';

class ChatItemEntityMapper extends ClassMapperBase<ChatItemEntity> {
  ChatItemEntityMapper._();

  static ChatItemEntityMapper? _instance;
  static ChatItemEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatItemEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatItemEntity';

  static String? _$name(ChatItemEntity v) => v.name;
  static const Field<ChatItemEntity, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );

  @override
  final MappableFields<ChatItemEntity> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static ChatItemEntity _instantiate(DecodingData data) {
    return ChatItemEntity(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatItemEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatItemEntity>(map);
  }

  static ChatItemEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChatItemEntity>(json);
  }
}

mixin ChatItemEntityMappable {
  String toJsonString() {
    return ChatItemEntityMapper.ensureInitialized().encodeJson<ChatItemEntity>(
      this as ChatItemEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ChatItemEntityMapper.ensureInitialized().encodeMap<ChatItemEntity>(
      this as ChatItemEntity,
    );
  }

  ChatItemEntityCopyWith<ChatItemEntity, ChatItemEntity, ChatItemEntity>
  get copyWith => _ChatItemEntityCopyWithImpl<ChatItemEntity, ChatItemEntity>(
    this as ChatItemEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ChatItemEntityMapper.ensureInitialized().stringifyValue(
      this as ChatItemEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatItemEntityMapper.ensureInitialized().equalsValue(
      this as ChatItemEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatItemEntityMapper.ensureInitialized().hashValue(
      this as ChatItemEntity,
    );
  }
}

extension ChatItemEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatItemEntity, $Out> {
  ChatItemEntityCopyWith<$R, ChatItemEntity, $Out> get $asChatItemEntity =>
      $base.as((v, t, t2) => _ChatItemEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatItemEntityCopyWith<$R, $In extends ChatItemEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  ChatItemEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatItemEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatItemEntity, $Out>
    implements ChatItemEntityCopyWith<$R, ChatItemEntity, $Out> {
  _ChatItemEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatItemEntity> $mapper =
      ChatItemEntityMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  ChatItemEntity $make(CopyWithData data) =>
      ChatItemEntity(name: data.get(#name, or: $value.name));

  @override
  ChatItemEntityCopyWith<$R2, ChatItemEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatItemEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

