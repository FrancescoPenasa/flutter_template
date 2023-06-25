import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../core/providers/auth_provider.dart';
import '../core/services/auth_api_service.dart';
import '../core/services/secure_storage_service.dart';
import '../core/services/std_api_service.dart';
import '../main.dart';
import '../ui/pages/homepage.dart';
import '../ui/shared/widgets/custom_dialog.dart';
import 'service_locator.dart';

abstract class ErrorHandler {
  static void apiResult(ApiFailure code, String desc) {
    logger.error("${code.toString()}:$desc");
    if (code == ApiFailure.error400) {
      kConnExceptionDialog(desc);
    } else if (code == ApiFailure.error401) {
      services.get<SecureStorage>().reset();
      Provider.of<AuthProvider>(navigatorKey.currentContext!, listen: false)
          .reset();
      Navigator.of(navigatorKey.currentContext!)
          .popUntil(ModalRoute.withName(HomePage.routeName));
      Navigator.of(navigatorKey.currentContext!).pushNamed(HomePage.routeName);
    } else {
      kConnExceptionDialog("unkown error");
    }
  }

  static Tuple2<ApiFailure, String> handleErrorCode(Response res) {
    if (res.statusCode == 400) {
      return Tuple2(ApiFailure.error400, res.body);
    } else if (res.statusCode == 401) {
      return Tuple2(ApiFailure.error401, res.body);
    }
    return Tuple2(ApiFailure.error, res.body);
  }

  static Tuple2<LoginFailure, String> handleAuthErrorCode(Response res) {
    if (res.statusCode == 400) {
      return Tuple2(LoginFailure.error400, res.body);
    } else if (res.statusCode == 401) {
      return Tuple2(LoginFailure.error401, res.body);
    }
    return Tuple2(LoginFailure.error, res.body);
  }
}
