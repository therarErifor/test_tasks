import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileClient {

  Future<String> get _getDirPath async {
    final localDir = await getApplicationDocumentsDirectory();
    final localPath = localDir.path;
    final localFile = File('$localPath/data.txt');
    // if(!await localFile.exists()){
      await localFile.create();
      await localFile.writeAsString('');
    // }
    return localPath;
  }

  Future<String> readLocalUrl() async {
    final dirPath = await _getDirPath;
    final localFile = File('$dirPath/data.txt');
    final String url = await localFile.readAsString(encoding: utf8);

    return url;
  }

  Future<void> writeLocalUrl(String url) async {
    final dirPath = await _getDirPath;
    final localFile = File('$dirPath/data.txt');

    await localFile.writeAsString(url);
  }
}