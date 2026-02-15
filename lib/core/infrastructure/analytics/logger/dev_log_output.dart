// lib/core/infrastructure/errors/dev_log_output.dart
// Only the **first** line of a multi‑line log gets the coloured [GROUP] tag.
// Subsequent lines are emitted with an empty tag so they copy/paste cleanly.

import 'dart:developer' as dev;

import 'package:logger/logger.dart';

class DevLogOutput extends LogOutput {
  static final _ansi = RegExp(r'\x1B\[[0-9;]*[mK]');
  static final _prefix = RegExp(r'^\[(\w+)]\s');

  String _stripAnsi(String s) => s.replaceAll(_ansi, '');

  @override
  void output(OutputEvent event) {
    if (event.lines.isEmpty) return;

    if (event.lines.isEmpty) return;

    // Extract group from first (de-ANSI-fied) line
    final firstRaw = event.lines.first;
    final firstClean = _stripAnsi(firstRaw);
    final firstMatch = _prefix.firstMatch(firstClean);
    final logGroup = firstMatch?.group(1) ?? 'APP';

    final name = "LOG $logGroup";

    final firstBody = firstMatch != null ? firstClean.substring(firstMatch.end) : firstClean;
    dev.log(firstBody, name: name);

    for (var i = 1; i < event.lines.length; i++) {
      final raw = event.lines[i];
      final match = _prefix.firstMatch(raw);
      final clean = match != null ? raw.substring(match.end) : raw;

      // Only the first line carries the group tag.
      dev.log(clean, name: name);
    }
  }
}
