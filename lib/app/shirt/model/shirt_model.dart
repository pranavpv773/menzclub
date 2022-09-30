// To parse this JSON data, do
//
//     final shirtModel = shirtModelFromJson(jsonString);

import 'dart:convert';

List<ShirtModel> shirtModelFromJson(String str) =>
    List<ShirtModel>.from(json.decode(str).map((x) => ShirtModel.fromJson(x)));

String shirtModelToJson(List<ShirtModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShirtModel {
  ShirtModel({
    this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.offer,
    required this.category,
    required this.collection,
    required this.color,
    required this.brand,
    required this.fit,
    required this.size,
    required this.material,
  });

  String? id;
  String name;
  String description;
  List<String> images;
  int price;
  int offer;
  String category;
  String collection;
  String color;
  String brand;
  String fit;
  int size;
  String material;

  factory ShirtModel.fromJson(Map<String, dynamic> json) => ShirtModel(
        id: json["_id"] ?? "",
        name: json["shirt_name"],
        description: json["shirt_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["shirt_price"],
        offer: json["shirt_offer"],
        category: json["shirt_category"],
        collection: json["shirt_collection"],
        color: json["shirt_color"],
        brand: json["shirt_brand"],
        fit: json["shirt_fit"],
        size: json["shirt_size"],
        material: json["shirt_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id ?? "",
        "shirt_name": name,
        "shirt_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "shirt_price": price,
        "shirt_offer": offer,
        "shirt_category": category,
        "shirt_collection": collection,
        "shirt_color": color,
        "shirt_brand": brand,
        "shirt_fit": fit,
        "shirt_size": size,
        "shirt_material": material,
      };
}
