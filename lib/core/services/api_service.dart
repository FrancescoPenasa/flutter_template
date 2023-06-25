import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../constants.dart';
import '../../utils/error_handler.dart';

enum ApiFailure { error, error400, error401 }

/// api call class
abstract class API {
    static Map<String, String> _getHeaders(String jwt) {
  logger.info("_getHeaders($jwt)");
   return {
    'Authorization': 'Bearer $jwt',
    'Content-Type': 'application/json; charset=UTF-8'
  };
    }


/// GET method
static Future<Either<ApiFailure, String>> getAPI(String jwt, Uri url) async {
  logger.info("getAPI.req::$url");

  // execute api call
  final res = await http.get(url, headers: _getHeaders(jwt)).catchError((error) {
    throw Exception("$error");
  });

  logger.info("getAPI.res::${res.statusCode} | ${res.body}");

  // handle result
  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleErrorCode(res));
}

/// POST method
static Future<Either<ApiFailure, String>> postAPI(String jwt, Uri url, String body) async {
  logger.info("postAPI.req::$url | body: $body");

  // execute api post
  final res =
      await http.post(url, headers: _getHeaders(jwt), body: body).catchError((error) {
    throw Exception("$error");
  });

  logger.info("postAPI.res::${res.statusCode} | ${res.body}");

  // handle result
  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleErrorCode(res));
}

/// multipart POST method
static Future<Either<ApiFailure, String>> multipartPostAPI(String jwt, Uri url, String body, List<String> files) async {
  logger.info("multipartPostAPI: req"
      "url: $url\n"
      "body: $body\n"
      "files: $files\n");

  final req = http.MultipartRequest("POST", url);
  req.headers.addAll(headers: _getHeaders(jwt));

  req.fields['data'] = body;
  for (int i = 0; i < files.length; i++) {
    List<String> mimeType =
        (lookupMimeType(files[i]) ?? "text/plain").split('/');
    req.files.add(await http.MultipartFile.fromPath('file_${i + 1}', files[i],
        contentType: MediaType(mimeType[0], mimeType[1])));
    logger.warning(mimeType.toString());
  }

  final res =
      await http.Response.fromStream(await req.send()).catchError((onError) {
    throw Exception("$onError");
  });

  logger.info("postAPI.res::${res.statusCode} | ${res.body}");

  if (res.statusCode == 200) {
    return Right(res.body);
  }
  return Left(ErrorHandler.handleErrorCode(res));
}

}