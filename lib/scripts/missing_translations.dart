// lib/scripts/missing_translations.dart
//
// Usage examples
// --------------
//   # Turkish ➜ English  → lib/scripts/patches/tr_en.json
//   dart run lib/scripts/missing_translations.dart tr en
//
//   # English ➜ Arabic   → lib/scripts/patches/en_ar.json
//   dart run lib/scripts/missing_translations.dart en ar
//
//   # Custom output file
//   dart run lib/scripts/missing_translations.dart en tr lib/scripts/patches/missing.json

import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  if (args.length < 2 || args.length > 3) {
    stderr.writeln('''
Usage  : dart run lib/scripts/missing_translations.dart <source-lang> <target-lang> [output-file]
Example: dart run lib/scripts/missing_translations.dart en tr
''');
    exit(64); // EX_USAGE
  }

  final srcLang = args[0].toLowerCase();
  final tgtLang = args[1].toLowerCase();

  // Default: lib/scripts/patches/<src>_<tgt>.json
  final defaultPatchDir = Directory('lib/scripts/missings');
  if (!await defaultPatchDir.exists()) {
    await defaultPatchDir.create(recursive: true);
  }
  final defaultPatchPath = '${defaultPatchDir.path}/$srcLang\_$tgtLang.json';
  final outPath = args.length == 3 ? args[2] : defaultPatchPath;

  final srcPath = 'assets/translations/$srcLang.json';
  final tgtPath = 'assets/translations/$tgtLang.json';

  Future<Map<String, dynamic>> readJson(String path) async {
    final file = File(path);
    if (!await file.exists()) {
      stderr.writeln('❌ File not found: $path');
      exit(66); // EX_NOINPUT
    }
    return jsonDecode(await file.readAsString()) as Map<String, dynamic>;
  }

  final srcMap = await readJson(srcPath);
  final tgtMap = await readJson(tgtPath);

  final missing = <String, dynamic>{};

  srcMap.forEach((k, v) {
    final tgt = tgtMap[k];
    if (tgt == null || (tgt is String && tgt.trim().isEmpty)) {
      missing[k] = v; // keep source value for context
    }
  });

  await File(outPath)
      .writeAsString(JsonEncoder.withIndent('  ').convert(missing) + '\n');

  stdout.writeln(
      '✅ Found ${missing.length} missing translation(s). Written to $outPath');
}
