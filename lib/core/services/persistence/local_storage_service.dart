import 'package:shared_preferences/shared_preferences.dart';

import 'persistence.dart';


class LocalStoragePersistence extends Persistance {
  final Future<SharedPreferences> instanceFuture =
  SharedPreferences.getInstance();

  @override
  Future<int> getTmpData() async {
    final prefs = await instanceFuture;
    return prefs.getInt('highestLevelReached') ?? 0;
  }
}
