// To parse this JSON data, do
//
//     final catagoricModel = catagoricModelFromJson(jsonString);

import 'dart:convert';

List<CatagoricModel> catagoricModelFromJson(String str) => List<CatagoricModel>.from(json.decode(str).map((x) => CatagoricModel.fromJson(x)));

String catagoricModelToJson(List<CatagoricModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatagoricModel {
  CatagoricModel({
    this.id,
    this.name,
    this.image,
  });

  int? id;
  String? name;
  String? image;

  factory CatagoricModel.fromJson(Map<String, dynamic> json) => CatagoricModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
  };
}
