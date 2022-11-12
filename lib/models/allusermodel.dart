// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'dart:convert';

List<AllUserModel> allUserModelFromJson(String str) => List<AllUserModel>.from(json.decode(str).map((x) => AllUserModel.fromJson(x)));

String allUserModelToJson(List<AllUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUserModel {
  AllUserModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
  });

  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String ?avatar;

  factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    name: json["name"] == null ? null : json["name"],
    role: json["role"] == null ? null : json["role"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "name": name == null ? null : name,
    "role": role == null ? null : role,
    "avatar": avatar == null ? null : avatar,
  };
}
