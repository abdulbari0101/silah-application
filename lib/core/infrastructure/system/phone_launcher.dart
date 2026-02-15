import 'package:url_launcher/url_launcher.dart';

class PhoneLauncher {
  static Future<bool> call(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
    }
    return false;
  }
}



