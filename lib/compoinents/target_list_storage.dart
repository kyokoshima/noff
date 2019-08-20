
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class TargetListStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    File file = File('$path/target.json');
    if (!(await file.exists())) {
      file.create();
    }
    return file;
  }

  Future<List<Map>> readList() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return jsonDecode(contents);
    } catch (e) {
      
      var list = [
        { "name": "aaaa" },
        { "name": "bbbb" },
        { "name": "cccc" },
      ];
      return list;
    }
  }

  Future<File> writeList(Object list) async {
    final file = await _localFile;
    return file.writeAsString(jsonEncode(list));
  }
}