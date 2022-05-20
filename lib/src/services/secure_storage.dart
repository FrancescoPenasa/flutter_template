import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  late final FlutterSecureStorage storage;
  final String _tokenKey = "token";

  SecureStorage() {
    storage = const FlutterSecureStorage();
  }

  Future<void> setToken(String value) async {
    await storage.write(key: _tokenKey, value: value);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  Future<void> rmToken() async {
    await storage.delete(key: _tokenKey);
  }

  Future<void> reset() async {
    await storage.deleteAll();
  }
}
