import 'dart:convert';

ShoesModel shoesModelFromJson(String str) =>
    ShoesModel.fromJson(json.decode(str));

String shoesModelToJson(ShoesModel data) => json.encode(data.toJson());

class ShoesModel {
  ShoesModel({
    required this.shoes,
    required this.status,
    required this.message,
  });

  List<Shoes> shoes;
  bool status;
  String message;

  factory ShoesModel.fromJson(Map<String, dynamic> json) => ShoesModel(
        shoes: List<Shoes>.from(json["shoes"].map((x) => Shoes.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "shoes": List<dynamic>.from(shoes.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Shoes {
  Shoes({
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

  factory Shoes.fromJson(Map<String, dynamic> json) => Shoes(
        id: json["_id"],
        name: json["shoes_name"],
        description: json["shoes_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["shoes_price"],
        offer: json["shoes_offer"],
        category: json["shoes_category"],
        collection: json["shoes_collection"],
        color: json["shoes_color"],
        brand: json["shoes_brand"],
        fit: json["shoes_fit"],
        size: json["shoes_size"],
        material: json["shoes_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "shoes_name": name,
        "shoes_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "shoes_price": price,
        "shoes_offer": offer,
        "shoes_category": category,
        "shoes_collection": collection,
        "shoes_color": color,
        "shoes_brand": brand,
        "shoes_fit": fit,
        "shoes_size": size,
        "shoes_material": material,
      };
}
