import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';


class UserProvider with ChangeNotifier {
  bool _isLoading = false;
  User _user = User.fromJson({"id": -1});

  bool get isLoading => _isLoading;
  User get user => _user;

  /// retrieve data about the single offer
  void fetchData(String jwt, int id) async {
    if (id == -1) {
      kErrorDialog("$error"); 
      return;
    }

    _isLoading = true;
    notifyListeners();

    late final Either<Tuple2<ApiFailure, String>, String> res;
    String body = jsonEncode({"id": id});

    try {
      res = await postAPI(jwt, kUrls.user, body);
    } on Exception catch (error) {
      kErrorDialog("$error"); 
      _isLoading = false;
      notifyListeners();
      return;
    }

    res.fold((l) {
      ErrorHandler.apiResult(l.value1, l.value2);
    }, (r) async {
      _user = userFromJson(r);
      notifyListeners();
    });

    _isLoading = false;
    notifyListeners();
  }

}
