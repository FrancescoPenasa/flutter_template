import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SharedStorage {
  final String _imei = "imei";

  late final SharedPreferences storage;

  Future<void> init() async {
    storage = await SharedPreferences.getInstance();
  }

  Future<bool> setImei(String s) async {
    return await storage.setString(_imei, s);
  }

  String getImei() {
    String? s = storage.getString(_imei);
    if (s != null) {
      return s;
    } else {
      s = const Uuid().v4();
      setImei(s);
      return s;
    }
  }

  Future<bool> reset() async {
    return await storage.clear();
  }
}
