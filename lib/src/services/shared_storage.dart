import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences implementation
class SharedStorage {
  late final SharedPreferences storage;
  final String _tokenKey = "token";

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<bool> setToken(String value) async {
    return await storage.setString(_tokenKey, value);
  }

  String? getToken() {
    return storage.getString(_tokenKey);
  }

  Future<bool> reset() async {
    return await storage.clear();
  }
}
