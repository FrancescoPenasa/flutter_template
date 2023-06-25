import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// jwt contain the logged jwt
class SecureStorage {
  late final FlutterSecureStorage storage;
  final String _jwtKey = "jwt";
  final String _roleKey = "role";

  SecureStorage() {
    storage = const FlutterSecureStorage();
  }

  Future<void> setJwt(String jwt) async {
    await storage.write(key: _jwtKey, value: jwt);
  }

  Future<String> getJwt() async {
    return await storage.read(key: _jwtKey) ?? "";
  }

  Future<void> rmJwt() async {
    await storage.delete(key: _jwtKey);
  }

  Future<void> reset() async {
    await storage.deleteAll();
  }
}
