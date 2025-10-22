import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart' as p;

Future<Database> getDatabase([String dbName = "ndk_cache_manager"]) async {
  if (kIsWeb) {
    var factory = databaseFactoryWeb;
    return await factory.openDatabase(dbName);
  }

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(appDocumentsDir.path, "Peridot", '$dbName.db');
  await Directory(p.dirname(dbPath)).create(recursive: true);
  return await databaseFactoryIo.openDatabase(dbPath);
}
