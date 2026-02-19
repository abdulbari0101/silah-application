// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message_type.dart';

class MessageTypeMapper extends EnumMapper<MessageType> {
  MessageTypeMapper._();

  static MessageTypeMapper? _instance;
  static MessageTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageTypeMapper._());
    }
    return _instance!;
  }

  static MessageType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MessageType decode(dynamic value) {
    switch (value) {
      case r'text':
        return MessageType.text;
      case r'image':
        return MessageType.image;
      case r'file':
        return MessageType.file;
      case r'system':
        return MessageType.system;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MessageType self) {
    switch (self) {
      case MessageType.text:
        return r'text';
      case MessageType.image:
        return r'image';
      case MessageType.file:
        return r'file';
      case MessageType.system:
        return r'system';
    }
  }
}

extension MessageTypeMapperExtension on MessageType {
  String toValue() {
    MessageTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MessageType>(this) as String;
  }
}

