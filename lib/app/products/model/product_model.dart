import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.offer,
    required this.category,
    required this.color,
    required this.brand,
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
  String color;
  String brand;
  int size;
  String material;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["product_name"],
        description: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["product_price"],
        offer: json["product_offer"],
        category: json["product_category"],
        color: json["product_color"],
        brand: json["product_brand"],
        size: json["product_size"],
        material: json["product_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": name,
        "product_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "product_price": price,
        "product_offer": offer,
        "product_category": category,
        "product_color": color,
        "product_brand": brand,
        "product_size": size,
        "product_material": material,
      };
}
