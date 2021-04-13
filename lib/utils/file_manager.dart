/*
 * Copyright by Aphelia Innovation,This whole code is developed  and managed and redeveloped by parmeet singh,with authority of Aphelia.
 */

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager{

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    final file = File('${path}/macf.txt');
    return file;
  }

  Future<File> writeJson(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  Future<File> writeImage(File file,String name) async {

    final path = await _localPath;
    file.rename(name);
    final File newImage = await file.copy('$path/$name.jpg');
    return newImage;
  }



  read(String name) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$name.png');
       return file;
    } catch (e) {
      throw e;
    }
  }

  deleteByName(String name) async {
     File file=await read(name);
    await file.delete();
  }





}

