import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_persistence.dart';

class SecureStoragePersistence extends AuthPersistence {
  late final FlutterSecureStorage storage;
  final String _jwtKey = "jwt";

  SecureStoragePersistence() {
    storage = const FlutterSecureStorage();
  }

  @override
  Future<String> getJwt() async {
    return await storage.read(key: _jwtKey) ?? "";
  }

  @override
  Future<void> reset() async {
    await storage.deleteAll();
  }

  @override
  Future<void> rmJwt() async {
    await storage.delete(key: _jwtKey);
  }

  @override
  Future<void> setJwt(String jwt) async {
    await storage.write(key: _jwtKey, value: jwt);
  }
}
