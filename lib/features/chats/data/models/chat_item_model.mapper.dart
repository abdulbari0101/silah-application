// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_item_model.dart';

class ChatItemModelMapper extends ClassMapperBase<ChatItemModel> {
  ChatItemModelMapper._();

  static ChatItemModelMapper? _instance;
  static ChatItemModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatItemModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatItemModel';

  static String? _$name(ChatItemModel v) => v.name;
  static const Field<ChatItemModel, String> _f$name = Field(
    'name',
    _$name,
    key: r'NAME',
    opt: true,
  );

  @override
  final MappableFields<ChatItemModel> fields = const {#name: _f$name};
  @override
  final bool ignoreNull = true;

  static ChatItemModel _instantiate(DecodingData data) {
    return ChatItemModel(name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatItemModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatItemModel>(map);
  }

  static ChatItemModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ChatItemModel>(json);
  }
}

mixin ChatItemModelMappable {
  String toJsonString() {
    return ChatItemModelMapper.ensureInitialized().encodeJson<ChatItemModel>(
      this as ChatItemModel,
    );
  }

  Map<String, dynamic> toJson() {
    return ChatItemModelMapper.ensureInitialized().encodeMap<ChatItemModel>(
      this as ChatItemModel,
    );
  }

  ChatItemModelCopyWith<ChatItemModel, ChatItemModel, ChatItemModel>
  get copyWith => _ChatItemModelCopyWithImpl<ChatItemModel, ChatItemModel>(
    this as ChatItemModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ChatItemModelMapper.ensureInitialized().stringifyValue(
      this as ChatItemModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatItemModelMapper.ensureInitialized().equalsValue(
      this as ChatItemModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatItemModelMapper.ensureInitialized().hashValue(
      this as ChatItemModel,
    );
  }
}

extension ChatItemModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatItemModel, $Out> {
  ChatItemModelCopyWith<$R, ChatItemModel, $Out> get $asChatItemModel =>
      $base.as((v, t, t2) => _ChatItemModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatItemModelCopyWith<$R, $In extends ChatItemModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name});
  ChatItemModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatItemModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatItemModel, $Out>
    implements ChatItemModelCopyWith<$R, ChatItemModel, $Out> {
  _ChatItemModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatItemModel> $mapper =
      ChatItemModelMapper.ensureInitialized();
  @override
  $R call({Object? name = $none}) =>
      $apply(FieldCopyWithData({if (name != $none) #name: name}));
  @override
  ChatItemModel $make(CopyWithData data) =>
      ChatItemModel(name: data.get(#name, or: $value.name));

  @override
  ChatItemModelCopyWith<$R2, ChatItemModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatItemModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

