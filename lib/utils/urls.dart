import '../constants.dart';

abstract class kUrls {
  static const String _baseUrl = kDebugMode
      ? 'developmentUrl'
      : 'productionUrl';
  static const String _apiUrl = "$_baseUrl/api/v1";
  static const String _login = '$_apiUrl/login';
  static const String _logout = '$_apiUrl/logout';

  static final Uri login = Uri.parse("$_apiUrl/login");
  static final Uri logout = Uri.parse("$_apiUrl/logout");
}
