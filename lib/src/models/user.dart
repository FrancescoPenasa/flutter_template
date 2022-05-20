import 'dart:convert';

import '../../constants.dart';

String _path = "lib/src/models/user.dart";
String _file = "user.dart";

User userFromJson(String str) => User.fromJson(jsonDecode(str));

class User {
  late final int? id;
  late final String? name;

  User({
    this.id = -1,
    this.name = "unknown",
  }) {
    logger.head(_path);
    logger.log("$_file: constructor()");
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"] {
    logger.head(_path);
    logger.log("$_file: fromJson()");
  }

  Map<String, dynamic> toJson() {
    logger.head(_path);
    logger.log("$_file: toJson()");
    return {
        "id": id,
        "name": name,
      };
  }
}

