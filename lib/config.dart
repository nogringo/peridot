import 'package:flutter/foundation.dart';

const appTitle = "Peridot";
const lowerCaseAppTitle = "Peridot";
const databaseName = "${StorageKeys.secureStoragePrefix}$lowerCaseAppTitle";

class StorageKeys {
  static const secureStoragePrefix = kDebugMode ? "dev_" : "";
  static const privateKeys = "${secureStoragePrefix}private_keys";
}
