import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import '../services/persistence/persistence.dart';

/// Provider controller to manage authentication
class UserProvider with ChangeNotifier {
  static final _log = Logger('BannerAdWidget');
  final Persistance _persistance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// Creates an instance of [UserProvider] backed by an injected
  /// persistence [persistance].
  UserProvider(Persistance persistance) : _persistance = persistance;



  /// Fetches the latest data from the backing persistence store.
  Future<void> getTmpData() async {
    final level = await _persistance.getTmpData();
    _log.info(level);

  }

  void reset() {
    _isLoading = false;
    notifyListeners();
  }

  void debug() {
    _log.info('Debug');
    _log.info(_persistance.toString());
  }
}