import 'dart:convert';


List<User> usersFromJson(String str) =>
    (List<User>.from(jsonDecode(str).map((x) => User.fromJson(x))));

User userFromJson(String str) => User.fromJson(jsonDecode(str));

class User {
  late final int id;
  late final String name;
  late final List<Permission> permissions;

  late final String? favoriteWord;
  late final Subject? favoriteSubject;

  User({
    required this.id,
    required this.name,
    required this.permissions,

    this.favoriteWord,
    this.favoriteSubject,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    name = json['name'] ?? '';
    permissions = (json["permissions"] == null)
        ? []
        : List<Permission>.from(
            json["permissions"].map((x) => Permission.fromJson(x)));

    favoriteWord = json["favoriteWord"];
    favoriteSubject = (json["favoriteSubject"] == null)
        ? null
        : Subject.fromJson(json["favoriteSubject"]);
  }

// todo test this
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'permissions': permissions.toJson(),

        'favoriteWord': favoriteWord,
        'favoriteSubject': favoriteSubject?.toJson().toString(),
      };

}
