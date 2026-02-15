// lib/scripts/unused_keys.dart
//
// Detect keys that live in assets/translations/<lang>.json
// but are NOT referenced in lib/core/config/localization/localizations_string_keys.dart
//
// USAGE
// -----
//   dart run lib/scripts/unused_keys.dart en
//     → writes lib/scripts/unused_en.json
//
//   dart run lib/scripts/unused_keys.dart tr lib/scripts/patches/tr_unused.json
//
// OPTIONAL FLAGS
//   --src=<path>   path to the Strings class (default shown below)
//   --json=<path>  override language JSON path

import 'dart:convert';
import 'dart:io';

void die(String msg, [int exitCode = 1]) {
  stderr.writeln('❌ $msg');
  exit(exitCode);
}

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    die('Usage: dart run lib/scripts/unused_keys.dart <lang> [output-file]', 64);
  }

  final lang = args[0].toLowerCase();
  final outPath = args.length > 1
      ? args[1]
      : 'lib/scripts/unused_$lang.json';

  // ------------ optional overrides --------------
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

  // ------------ collect referenced keys ---------
  final srcFile = File(srcPath);
  if (!await srcFile.exists()) die('Source file not found: $srcPath', 66);
  final srcText = await srcFile.readAsString();

  final usedKeys = <String>{};
  final reg = RegExp(r'"([^"]+)"'); // all double-quoted literals
  for (final m in reg.allMatches(srcText)) {
    final k = m.group(1);
    if (k != null && k.trim().isNotEmpty) usedKeys.add(k);
  }

  // ------------ load language JSON --------------
  final langFile = File(jsonPath);
  if (!await langFile.exists()) die('Language file not found: $jsonPath', 66);
  final Map<String, dynamic> langMap =
      jsonDecode(await langFile.readAsString()) as Map<String, dynamic>;

  // ------------ find unused ---------------------
  final unused = <String, dynamic>{};
  langMap.forEach((k, v) {
    if (!usedKeys.contains(k)) unused[k] = v;
  });

  await File(outPath)
      .writeAsString(JsonEncoder.withIndent('  ').convert(unused) + '\n');

  stdout.writeln(
      '✅ Detected ${unused.length} unused key(s). Output → $outPath');
}
