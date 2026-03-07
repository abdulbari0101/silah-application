// lib/scripts/sort_translations.dart
//
// Sort the keys of <target-lang>.json to match the order in <reference-lang>.json
//
// Usage examples
// --------------
//   dart run lib/scripts/sort_translations.dart en tr
//     ↳ reads  assets/translations/en.json  (reference)
//       and   assets/translations/tr.json  (target)
//       writes lib/scripts/sorted_tr.json
//
//   dart run lib/scripts/sort_translations.dart en ar lib/scripts/patches/ar_sorted.json
//     ↳ custom output path

import 'dart:convert';
import 'dart:io';

Future<void> main(List<String> args) async {
  if (args.length < 2 || args.length > 3) {
    stderr.writeln('''
Usage  : dart run lib/scripts/sort_translations.dart <reference-lang> <target-lang> [output-file]
Example: dart run lib/scripts/sort_translations.dart en tr
''');
    exit(64);
  }

  final refLang = args[0].toLowerCase();
  final tgtLang = args[1].toLowerCase();

  // default output in the *same folder as this script*
  final scriptDir = File.fromUri(Platform.script).parent;
  final defaultOut = '${scriptDir.path}/sorted_$tgtLang.json';
  final outPath = args.length == 3 ? args[2] : defaultOut;

  final refPath = 'assets/translations/$refLang.json';
  final tgtPath = 'assets/translations/$tgtLang.json';

  Future<Map<String, dynamic>> readJson(String p) async {
    final f = File(p);
    if (!await f.exists()) {
      stderr.writeln('❌ File not found: $p');
      exit(66);
    }
    return jsonDecode(await f.readAsString()) as Map<String, dynamic>;
  }

  final refMap = await readJson(refPath);
  final tgtMap = await readJson(tgtPath);

  // Use LinkedHashMap to preserve insertion order
  final ordered = <String, dynamic>{};

  // 1️⃣ Keys that appear in reference — in the same order
  for (final key in refMap.keys) {
    if (tgtMap.containsKey(key)) {
      ordered[key] = tgtMap[key];
    }
  }

  // 2️⃣ Any extra keys present only in target — append alphabetically
  final extras = tgtMap.keys
      .where((k) => !refMap.containsKey(k))
      .toList()
    ..sort();
  for (final key in extras) {
    ordered[key] = tgtMap[key];
  }

  await File(outPath)
      .writeAsString('${JsonEncoder.withIndent('  ').convert(ordered)}\n');

  stdout.writeln(
      '✅ Sorted ${ordered.length} entries. Output written to $outPath');
}
