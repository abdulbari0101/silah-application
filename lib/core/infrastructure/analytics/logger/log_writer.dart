import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LogWriter {
  static Future<void> write(String log) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/network_logs.txt');
    await file.writeAsString('$log\n', mode: FileMode.append);
  }
}
