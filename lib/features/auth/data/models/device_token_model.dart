import 'package:dart_mappable/dart_mappable.dart';
part 'device_token_model.mapper.dart';

@MappableClass(ignoreNull: true)
class DeviceTokenModel with DeviceTokenModelMappable {
  @MappableField(key: 'DeviceToken')
  final String? deviceToken;

  const DeviceTokenModel({this.deviceToken});

  }
