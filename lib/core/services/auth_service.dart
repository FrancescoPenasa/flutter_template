import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../constants.dart';

enum LoginFailure { error, error400, error401 }

// i am not even sure if this is useful for anything, 
// maybe just to help the server understand who is calling
const String client_id ="id";
const String client_secret = "secret";

String _getEncodedAuthorizationToken() {
  logger.info("_getEncodedAuthorizationToken");
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return stringToBase64.encode("$client_id:$client_secret");
}

Future<Map<String, String>> _retrieveDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Map<String, String> info = {
    'os': "unknown",
    'imei': "unknown",
    'nome': "unknown"
  };

  info['imei'] = services.get<SharedStorage>().getImei();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    info['os'] = "Android";
    info['nome'] = androidInfo.model;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    info['os'] = "iOS";
    info['nome'] = iosInfo.utsname.machine ?? "NotRecognized";
  } else {
    info['os'] = "NotRecognized";
  }

  return info;
}

/// Login API
Future<Either<Tuple2<LoginFailure, String>, String>> loginAPI(
    String user, String pw) async {
  logger.info("API: login");

  // get device data
  Map<String, String> deviceInfo = await _retrieveDeviceInfo();
  String? token;
  try {
    token = "Error";
    // token = await FirebaseMessaging.instance.getToken();
  } catch (onError) {
    token = "Error";
  }

  Map<String, String> headers = {
    'Authorization': 'Basic ${_getEncodedAuthorizationToken()}',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  String body = jsonEncode({
    "type": "LOGIN",
    "username": user.trim(),
    "password": pw,
    "cf": "",
    "code": "",
    "os": deviceInfo['os'],
    "token": token,
    "version": kBuildVersion,
    "imei": deviceInfo['imei'],
    "nome": deviceInfo['nome']
  });

  logger.info("API: login req"
      "url: ${UrlConstants.login}\n"
      "header: $headers\n"
      "body: $body");

  final res = await http
      .post(UrlConstants.login, headers: headers, body: body)
      .catchError((error) {
    throw Exception();
  });

  logger.info("API: login res"
      "statusCode: ${res.statusCode.toString()}\n"
      "body: ${res.body.toString()}");

  // status code authorized
  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleAuthErrorCode(res));
}

/// Logout API: accepted status code: 200
Future<Either<Tuple2<LoginFailure, String>, String>> logoutAPI(
    String jwt) async {
  logger.info("API: logout");

  Map<String, String> headers = {
    'Authorization': 'Bearer $jwt',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  String body = jsonEncode({"disconnect": "singolo"});

  logger.info("API: login req"
      "url: ${UrlConstants.logout}\n"
      "header: $headers\n"
      "body: $body");

  final res = await http
      .post(UrlConstants.logout, headers: headers, body: body)
      .catchError((error) {
    throw Exception();
  });

  logger.info("API: logout res"
      "statusCode: ${res.statusCode.toString()}\n"
      "body: ${res.body.toString()}");

  // status code authorized
  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleAuthErrorCode(res));
}

Future<Either<Tuple2<ApiFailure, String>, String>> forgotAPI(
    Uri url, String body) async {
  Map<String, String> headers = {
    'Authorization': 'Basic ${_getEncodedAuthorizationToken()}',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  logger.info("forgotAPI: req"
      "url: $url\n"
      "header: $headers\n"
      "body: $body");

  final res =
      await http.post(url, headers: headers, body: body).catchError((error) {
    throw Exception("Impossibile contattare il server $error");
  });
  logger.info("API: res"
      "statusCode: ${res.statusCode.toString()}\n"
      "body: ${res.body.toString()}");

  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleErrorCode(res));
}

Future<Either<Tuple2<ApiFailure, String>, String>> recuperoAPI(
    String jwt, Uri url, String body) async {
  Map<String, String> headers = {
    'Authorization': 'Bearer $jwt',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  logger.info("forgotAPI: req"
      "url: $url\n"
      "header: $headers\n"
      "body: $body");

  final res =
      await http.post(url, headers: headers, body: body).catchError((error) {
    throw Exception("Impossibile contattare il server $error");
  });
  logger.info("API: res"
      "statusCode: ${res.statusCode.toString()}\n"
      "body: ${res.body.toString()}");

  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleErrorCode(res));
}
