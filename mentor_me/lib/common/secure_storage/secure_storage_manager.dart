import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'secure_storage_manager_contract.dart';

final secureStorageManagerProvider = Provider<SecureStorageManager>((ref) {
  return SecureStorageManager();
});

class SecureStorageManager implements SecureStorageManagerContract {
  static final SecureStorageManager _instance =
      SecureStorageManager._internal();

  factory SecureStorageManager() => _instance;

  SecureStorageManager._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
