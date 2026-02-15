import 'package:silah_app/core/data/model/api/auth/token_model.dart';

extension TokenModelExtension on TokenModel? {
  String? get bearerToken => '${this?.tokenType ?? ''} ${this?.accessToken ?? ''}'.trim();

  bool? get isExpired {
    if (this?.expiresIn == null) return false; // treat as non-expiring
    final expiry = this!.createdAt.add(Duration(seconds: this!.expiresIn!));
    return DateTime.now().isAfter(expiry);
  }

  Duration? get timeUntilExpiry => this?.expiresIn == null
      ? null
      : this?.createdAt.add(Duration(seconds: this!.expiresIn!)).difference(DateTime.now());
}
