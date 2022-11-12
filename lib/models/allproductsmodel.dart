// To parse this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';

List<AllProductsModel> allProductsModelFromJson(String str) => List<AllProductsModel>.from(json.decode(str).map((x) => AllProductsModel.fromJson(x)));

String allProductsModelToJson(List<AllProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductsModel {
  AllProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String> ?images;

  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "description": description == null ? null : description,
    "category": category == null ? null : category!.toJson(),
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.keyLoremSpace,
  });

  int? id;
  Name? name;
  String? image;
  KeyLoremSpace? keyLoremSpace;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : nameValues.map[json["name"]],
    image: json["image"] == null ? null : json["image"],
    keyLoremSpace: json["keyLoremSpace"] == null ? null : keyLoremSpaceValues.map[json["keyLoremSpace"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : nameValues.reverse[name],
    "image": image == null ? null : image,
    "keyLoremSpace": keyLoremSpace == null ? null : keyLoremSpaceValues.reverse[keyLoremSpace],
  };
}

enum KeyLoremSpace { FASHION, WATCH, SHOES, RANDOM }

final keyLoremSpaceValues = EnumValues({
  "fashion": KeyLoremSpace.FASHION,
  "random": KeyLoremSpace.RANDOM,
  "shoes": KeyLoremSpace.SHOES,
  "watch": KeyLoremSpace.WATCH
});

enum Name { SHOES, OTHERS, FURNITURE, ELECTRONICS, CLOTHES }

final nameValues = EnumValues({
  "Clothes": Name.CLOTHES,
  "Electronics": Name.ELECTRONICS,
  "Furniture": Name.FURNITURE,
  "Others": Name.OTHERS,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
