// lib/scripts/missing_used_keys.dart
//
// Find translation keys used in `Strings` but missing in a given language JSON.
//
// USAGE
// -----
//   # Turkish gaps → lib/scripts/missing_tr_from_strings.json
//   dart run lib/scripts/missing_used_keys.dart tr
//
//   # Arabic gaps, custom output path
//   dart run lib/scripts/missing_used_keys.dart ar lib/scripts/patches/ar_missing.json
//
// OPTIONAL FLAGS
//   --src=<path>   override source Strings file
//   --json=<path>  override language JSON path

import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('''
Usage : dart run lib/scripts/missing_used_keys.dart <lang> [output-file]
Example: dart run lib/scripts/missing_used_keys.dart tr
''');
    exit(64); // EX_USAGE
  }

  final lang = args[0].toLowerCase();
  final outPath = args.length > 1
      ? args[1]
      : 'lib/scripts/missing_${lang}_from_strings.json';

  // Optional overrides
  final srcOverride =
      args.firstWhere((a) => a.startsWith('--src='), orElse: () => '');
  final jsonOverride =
      args.firstWhere((a) => a.startsWith('--json='), orElse: () => '');

  final srcPath = srcOverride.isNotEmpty
      ? srcOverride.substring(6)
      : 'lib/core/config/localization/localizations_string_keys.dart';

  final jsonPath = jsonOverride.isNotEmpty
      ? jsonOverride.substring(7)
      : 'assets/translations/$lang.json';

  // --- 1. Parse Strings file for all quoted keys -------------------------
  final srcFile = File(srcPath);
  if (!await srcFile.exists()) {
    stderr.writeln('❌ Source file not found: $srcPath');
    exit(66); // EX_NOINPUT
  }
  final srcText = await srcFile.readAsString();
  final keyRegex = RegExp(r'"([^"]+)"');
  final usedKeys = <String>{};
  for (final m in keyRegex.allMatches(srcText)) {
    final k = m.group(1);
    if (k != null && k.trim().isNotEmpty) {
      usedKeys.add(k);
    }
  }

  // --- 2. Load language JSON --------------------------------------------
  final langFile = File(jsonPath);
  if (!await langFile.exists()) {
    stderr.writeln('❌ Language file not found: $jsonPath');
    exit(66);
  }
  final Map<String, dynamic> langMap =
      jsonDecode(await langFile.readAsString()) as Map<String, dynamic>;

  // --- 3. Collect missing / empty keys ----------------------------------
  final missing = <String, dynamic>{};
  for (final k in usedKeys) {
    final v = langMap[k];
    if (v == null || (v is String && v.trim().isEmpty)) {
      missing[k] = ""; // placeholder empty string
    }
  }

  // --- 4. Write output ---------------------------------------------------
  await File(outPath)
      .writeAsString('${JsonEncoder.withIndent('  ').convert(missing)}\n');

  stdout.writeln(
      '✅ Found ${missing.length} missing key(s). Output written to $outPath');
}
