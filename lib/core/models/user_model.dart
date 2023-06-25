// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

/// from string to List<User>
List<User> usersFromJson(String str) =>
    (List<User>.from(jsonDecode(str).map((x) => User.fromJson(x))));

/// from string to User
User userFromJson(String str) => User.fromJson(jsonDecode(str));

enum UserType { unknown, admin, teacher, student }

/// User class, to keep track of the user of the device
class User extends Equatable  {
  late final int id;
  late final String name;
  late final String surname;
  late final String? favColor;
  late final String? favSubject;
  late final int type;

  User({
    required this.id,
    required this.name,
    required this.surname,
    this.favColor,
    this.favSubject,
    required this.type,
  });

  UserType getType() {
    switch (type) {
      case 1:
        return UserType.admin;
      case 1:
        return UserType.student;
      case 2:
        return UserType.teacher;
      default:
        return UserType.unknown;
    }
  }

  /// parse json fields to User object
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    name = json['name'] ?? '';
    surname = json['surname'] ?? '';
    favColor = json['favColor']; // this can be null
    favSubject = json['favSubject']; // this can be null
    type = json['type'] ?? -1;
  }

  /// parsese the object back to json, useful when you want to store data in
  /// the device
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'favColor': favColor,
        'favSubject': favSubject,
        'type': type,
      };

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}
