import 'package:silah_app/core/infrastructure/platform/app_platform.dart';
import 'package:url_launcher/url_launcher.dart';

class MapLauncher {
  static Future<bool> openDirections({required double lat, required double lng}) async {
    if (!_isValidLatLng(lat, lng)) return false;
    final destination = '$lat,$lng';

    if (!AppPlatform.isIOS) {
      final googleNav = Uri.parse('google.navigation:q=$destination');
      if (await _launch(googleNav)) return true;
    }

    if (AppPlatform.isIOS) {
      final appleMaps = Uri.parse('http://maps.apple.com/?daddr=$destination');
      if (await _launch(appleMaps)) return true;
    }

    final web = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$destination');
    return _launch(web);
  }

  static Future<bool> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static bool _isValidLatLng(double lat, double lng) {
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }
}
