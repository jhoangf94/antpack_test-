import 'dart:convert';
import 'package:antpack_flutter_app/domain/entities/user.dart';

class UserModel extends User {
  final String name;
  final String email;
  final String city;
  final String companyName;

  UserModel({
    required this.name,
    required this.email,
    required this.city,
    required this.companyName,
  }) : super(
          name: name,
          email: email,
          city: city,
          companyName: companyName,
        );

  static List<UserModel> fromRawJson(String str) =>
      UserModel.fromJsonList(json.decode(str) as List);

  // Map a list user json to userModel
  static List<UserModel> fromJsonList(List jsonList) =>
      jsonList.map((json) => UserModel.fromJson(json)).toList();

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        city: json["address"]['city'],
        companyName: json["company"]['name'],
      );
}
