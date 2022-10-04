import 'dart:convert';

ShirtModel shirtModelFromJson(String str) =>
    ShirtModel.fromJson(json.decode(str));

String shirtModelToJson(ShirtModel data) => json.encode(data.toJson());

class ShirtModel {
  ShirtModel({
    required this.shirt,
    required this.status,
    required this.message,
  });

  List<Shirt> shirt;
  bool status;
  String message;

  factory ShirtModel.fromJson(Map<String, dynamic> json) => ShirtModel(
        shirt: List<Shirt>.from(json["shirt"].map((x) => Shirt.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "shirt": List<dynamic>.from(shirt.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Shirt {
  Shirt({
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

  factory Shirt.fromJson(Map<String, dynamic> json) => Shirt(
        id: json["_id"],
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
        "_id": id,
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
