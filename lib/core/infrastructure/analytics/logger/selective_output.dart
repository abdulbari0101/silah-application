// lib/core/infrastructure/errors/selective_output.dart
import 'package:logger/logger.dart';

class SelectiveOutput extends LogOutput {
  final LogOutput devOutput; // e.g. DevLogOutput()
  final LogOutput fallback; // e.g. ConsoleOutput()
  final Set<String> groups; // uppercase names: 'NETWORK', 'API', ...
  final Set<Level> levels; // which levels should be routed

  // Strip ANSI color codes (PrettyPrinter adds them when colors: true)
  static final _ansi = RegExp(r'\x1B\[[0-9;]*[mK]');
  static final _prefix = RegExp(r'^\[(\w+)]\s');

  SelectiveOutput({
    required this.devOutput,
    required this.fallback,
    required this.groups,
    this.levels = const {Level.debug, Level.info, Level.warning, Level.error, Level.trace},
  });

  String _stripAnsi(String s) => s.replaceAll(_ansi, '');

  String? _extractGroup(String line) {
    final clean = _stripAnsi(line);
    final m = _prefix.firstMatch(clean);
    return m?.group(1)?.toUpperCase();
  }

  @override
  void output(OutputEvent event) {
    final firstLine = event.lines.isNotEmpty ? event.lines.first : '';
    final group = _extractGroup(firstLine);
    final routeToDev = group != null && groups.contains(group) && levels.contains(event.level);

    (routeToDev ? devOutput : fallback).output(event);
  }

  @override
  Future<void> destroy() {
    devOutput.destroy();
    fallback.destroy();
    return super.destroy();
  }
}
