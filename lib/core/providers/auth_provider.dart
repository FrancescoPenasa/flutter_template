
import 'package:flutter/foundation.dart';


enum AuthStates { unknown, logged }

/// Provider controller to manage authentication
class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  // AuthStates _state = AuthStates.unknown;
  // String _token = "";

  bool get isLoading => _isLoading;
  // AuthStates get state => _state;
  // String get token => _token;

  void reset() {
    // _token = "";
    // _state = AuthStates.unknown;
  }

  /// retrieve data from securestorage if the user is already logged
  Future<void> fetchLocalData() async {
    _isLoading = true;
    notifyListeners();

    // get from secure storage
    // _token = await services.get<SecureStorage>().getJwt();

    _isLoading = false;
    notifyListeners();
  }


  /// manage login actions, send api call,
  Future<void> login(String username, String pw) async {
    _isLoading = true;
    notifyListeners();

    // late Map<String, dynamic> json;
    // late final Either<AuthFailure, String> res;
    //
    // // login api
    // try {
    //   res = await loginAPI(username, pw);
    // } on Exception catch (error) {
    //   //   ErrorHandler.exception(error);
    //   kErrorDialog("$error");
    //
    //   // todo test where we can put this
    //   _isLoading = false;
    //   notifyListeners();
    //   return;
    // }
    //
    //
    // res.fold((l) {
    //   ErrorHandler.apiResult(l);
    // }, (r) {
    //   json = jsonDecode(r);
    //
    //   // check nullability
    //   if (json["jwt"] == null) {
    //     kErrorDialog("jwt is null")
    //     _isLoading = false;
    //     notifyListeners();
    //     return;
    //   }
    //
    //   jwt = json["jwt"];
    //   services.get<SecureStorage>().setAuth(json["jwt"]);
    // });

    _isLoading = false;
    notifyListeners();
  }
}