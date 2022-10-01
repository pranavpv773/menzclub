import 'dart:convert';

JeansModel jeansModelFromJson(String str) =>
    JeansModel.fromJson(json.decode(str));

String jeansModelToJson(JeansModel data) => json.encode(data.toJson());

class JeansModel {
  JeansModel({
    required this.jeans,
    required this.status,
    required this.message,
  });

  List<Jeans> jeans;
  bool status;
  String message;

  factory JeansModel.fromJson(Map<String, dynamic> json) => JeansModel(
        jeans: List<Jeans>.from(json["jeans"].map((x) => Jeans.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "jeans": List<dynamic>.from(jeans.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Jeans {
  Jeans({
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

  factory Jeans.fromJson(Map<String, dynamic> json) => Jeans(
        id: json["_id"],
        name: json["jeans_name"],
        description: json["jeans_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["jeans_price"],
        offer: json["jeans_offer"],
        category: json["jeans_category"],
        collection: json["jeans_collection"],
        color: json["jeans_color"],
        brand: json["jeans_brand"],
        fit: json["jeans_fit"],
        size: json["jeans_size"],
        material: json["jeans_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "jeans_name": name,
        "jeans_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "jeans_price": price,
        "jeans_offer": offer,
        "jeans_category": category,
        "jeans_collection": collection,
        "jeans_color": color,
        "jeans_brand": brand,
        "jeans_fit": fit,
        "jeans_size": size,
        "jeans_material": material,
      };
}
