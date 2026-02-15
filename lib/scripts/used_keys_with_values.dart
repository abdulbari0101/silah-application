// lib/scripts/used_keys_with_values.dart
//
// Usage examples
// --------------
//   # Get the EN values for every key referenced in Strings
//   dart run lib/scripts/used_keys_with_values.dart en
//
//   # Same for Turkish, custom output path
//   dart run lib/scripts/used_keys_with_values.dart tr lib/scripts/patches/tr_used.json
//
// Flags
//  --src=<path>   Path to the Strings class (default shown below).
//  --json=<path>  Path to the language JSON if you don’t follow assets/translations/<lang>.json.

import 'dart:convert';
import 'dart:io';
import 'dart:collection';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('''
Usage : dart run lib/scripts/used_keys_with_values.dart <lang> [output-file]
Example: dart run lib/scripts/used_keys_with_values.dart en
''');
    exit(64); // EX_USAGE
  }

  String lang = args[0].toLowerCase();
  String outPath = args.length > 1 ? args[1] : 'lib/scripts/used_$lang.json';

  // Optional flags
  final srcFlag =
      args.firstWhere((a) => a.startsWith('--src='), orElse: () => '');
  final jsonFlag =
      args.firstWhere((a) => a.startsWith('--json='), orElse: () => '');

  String srcPath = srcFlag.isNotEmpty
      ? srcFlag.substring(6)
      : 'lib/core/config/localization/localizations_string_keys.dart';

  String jsonPath = jsonFlag.isNotEmpty
      ? jsonFlag.substring(7)
      : 'assets/translations/$lang.json';

  // ---------- 1. Collect used keys ---------------------------------------
  final srcFile = File(srcPath);
  if (!await srcFile.exists()) {
    stderr.writeln('❌ Source file not found: $srcPath');
    exit(66);
  }
  final srcContent = await srcFile.readAsString();
  final keyRegex = RegExp(r'"([^"]+)"');
  final usedKeys = <String>{};
  for (final m in keyRegex.allMatches(srcContent)) {
    final key = m.group(1);
    if (key != null && key.trim().isNotEmpty) {
      usedKeys.add(key);
    }
  }

  // ---------- 2. Load language JSON --------------------------------------
  final langFile = File(jsonPath);
  if (!await langFile.exists()) {
    stderr.writeln('❌ Language file not found: $jsonPath');
    exit(66);
  }
  final Map<String, dynamic> langMap =
      jsonDecode(await langFile.readAsString()) as Map<String, dynamic>;

  // ---------- 3. Build ordered map ---------------------------------------
  final ordered = LinkedHashMap<String, dynamic>();
  final sortedKeys = usedKeys.toList()..sort();
  for (final k in sortedKeys) {
    ordered[k] = langMap.containsKey(k) && (langMap[k] as String).trim().isNotEmpty
        ? langMap[k]
        : null; // null if missing/empty
  }

  // ---------- 4. Write out -----------------------------------------------
  final outFile = File(outPath);
  await outFile.writeAsString(
      JsonEncoder.withIndent('  ').convert(ordered) + '\n');

  stdout.writeln(
      '✅ Collected ${ordered.length} keys. Output written to $outPath');
}
