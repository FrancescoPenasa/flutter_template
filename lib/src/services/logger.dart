// ignore_for_file: avoid_print

import '../../constants.dart';

abstract class Logger {
  void log(String msg);
  void head(String msg);
  void foot(String msg);
}

class ConsoleLogger extends Logger {
  @override
  void log(String msg) {
    if (kDebugMode) {
      print('${DateTime.now()} : $msg');
    }
  }

  @override
  void head(String msg) {
    if (kDebugMode) {
      print('\n== $msg ==');
    }
  }

  @override
  void foot(String msg) {
    if (kDebugMode) {
      print('==> $msg <==\n');
    }
  }
}
