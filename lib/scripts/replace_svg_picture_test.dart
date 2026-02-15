import 'dart:io';

void main() {
  const testFilePath = 'test/test_svg_picture.dart'; // Replace with your test file path
  final file = File(testFilePath);

  if (!file.existsSync()) {
    return;
  }

  final original = file.readAsStringSync();
  final updated = replaceSvgPicture(original);

  if (updated != original) {
    final updatedWithImport = ensureImport(updated);
    file.writeAsStringSync(updatedWithImport);
  } else {}
}

String replaceSvgPicture(String content) {
  final buffer = StringBuffer();
  final regex = RegExp(
    r'SvgPicture\.asset\(\s*(.+?)\s*(,\s*[^)]*?)?\s*\)',
    multiLine: true,
    dotAll: true,
  );

  int lastMatchEnd = 0;

  for (final match in regex.allMatches(content)) {
    final assetExpr = match.group(1)!.trim();
    final args = match.group(2)?.trim();

    // Sanitize args: remove leading/trailing commas
    String cleanedArgs = '';
    if (args != null && args.isNotEmpty) {
      cleanedArgs = args.replaceAll(RegExp(r'^,+|,+$'), '').trim();
    }

    final replacement = cleanedArgs.isNotEmpty
        ? 'AppSvgIcon(assetName: $assetExpr, $cleanedArgs)'
        : 'AppSvgIcon(assetName: $assetExpr)';

    buffer
      ..write(content.substring(lastMatchEnd, match.start))
      ..write(replacement);
    lastMatchEnd = match.end;
  }

  buffer.write(content.substring(lastMatchEnd));
  return buffer.toString();
}

String ensureImport(String content) {
  const newImport = "import 'package:silah/core/presentation/widget/icons/app_svg_icon.dart';";

  if (content.contains(newImport)) return content;

  final lines = content.split('\n');
  int lastImportIndex = -1;

  // Find last line starting with `import `
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].trimLeft().startsWith('import ')) {
      lastImportIndex = i;
    }
  }

  if (lastImportIndex != -1) {
    lines.insert(lastImportIndex + 1, newImport);
    return lines.join('\n');
  } else {
    // No imports found; prepend at top
    return '$newImport\n\n$content';
  }
}
