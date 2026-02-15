
import 'prefs/prefs_store.dart';
import 'secure/secure_store.dart';


class AppCache {
  const AppCache({
    required this.prefs,
    required this.secure,
  });

  /// Plain key/value – best for **non-sensitive** data
  /// (settings, toggles, last-seen timestamps, etc.).
  final PrefsStore prefs;

  /// AES-encrypted & optional biometric-protected storage –
  /// use for **tokens, PINs, PII,** …
  final SecureStore secure;
}
