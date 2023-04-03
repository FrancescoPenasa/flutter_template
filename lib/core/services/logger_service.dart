import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants.dart';

abstract class Logger {
  void log(String msg);
  void info(String msg);
  void warning(String msg);
  void error(String msg);
}

class ConsoleLogger extends Logger {
  @override
  void log(String msg) {
    if (kDebugMode) {
      debugPrint('${DateTime.now()} : $msg');
    }
  }

  @override
  void warning(String msg) {
    debugPrint('\x1B[33m$msg\x1B[0m');
  }

  @override
  void error(String msg) {
    debugPrint('\x1B[31m$msg\x1B[0m');
  }

  @override
  void info(String msg) {
    debugPrint(msg);
  }
}

class FileLogger extends Logger {
    
  @override
  void log(String msg) async {
    if (kDebugMode) {
        final Directory directory = await getApplicationDocumentsDirectory();

        DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        String date = formatter.format(now);

        String logMsg = '${DateTime.now()} : $msg \n';
        File f = File("${directory.path}/$date.log");
        f.writeAsString(logMsg, mode: FileMode.append);
    }
  }

  @override
  void error(String msg) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    String logMsg = '${DateTime.now()} : ERROR : $msg \n';
    File f = File("${directory.path}/$date.log");
    f.writeAsString(logMsg, mode: FileMode.append);
  }

  @override
  void info(String msg) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    String logMsg = '${DateTime.now()} : INFO : $msg \n';
    File f = File("${directory.path}/$date.log");
    f.writeAsString(logMsg, mode: FileMode.append);
  }

  @override
  void warning(String msg) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);

    String logMsg = '${DateTime.now()} : WARNING : $msg \n';
    File f = File("${directory.path}/$date.log");
    f.writeAsString(logMsg, mode: FileMode.append);
  }
}
