import 'dart:convert';

TshirtModel tshirtModelFromJson(String str) =>
    TshirtModel.fromJson(json.decode(str));

String tshirtModelToJson(TshirtModel data) => json.encode(data.toJson());

class TshirtModel {
  TshirtModel({
    required this.tShirt,
    required this.status,
    required this.message,
  });

  List<TShirt> tShirt;
  bool status;
  String message;

  factory TshirtModel.fromJson(Map<String, dynamic> json) => TshirtModel(
        tShirt:
            List<TShirt>.from(json["tShirt"].map((x) => TShirt.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "tShirt": List<dynamic>.from(tShirt.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class TShirt {
  TShirt({
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

  factory TShirt.fromJson(Map<String, dynamic> json) => TShirt(
        id: json["_id"],
        name: json["tShirt_name"],
        description: json["tShirt_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["tShirt_price"],
        offer: json["tShirt_offer"],
        category: json["tShirt_category"],
        collection: json["tShirt_collection"],
        color: json["tShirt_color"],
        brand: json["tShirt_brand"],
        fit: json["tShirt_fit"],
        size: json["tShirt_size"],
        material: json["tShirt_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tShirt_name": name,
        "tShirt_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "tShirt_price": price,
        "tShirt_offer": offer,
        "tShirt_category": category,
        "tShirt_collection": collection,
        "tShirt_color": color,
        "tShirt_brand": brand,
        "tShirt_fit": fit,
        "tShirt_size": size,
        "tShirt_material": material,
      };
}
