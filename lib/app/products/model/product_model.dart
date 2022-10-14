import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    required this.productName,
    required this.productDescription,
    required this.images,
    required this.productPrice,
    required this.productOffer,
    required this.productCategory,
    required this.productColor,
    required this.productBrand,
    required this.productSize,
    required this.productMaterial,
  });

  String? id;
  String productName;
  String productDescription;
  List<String> images;
  int productPrice;
  int productOffer;
  String productCategory;
  String productColor;
  String productBrand;
  int productSize;
  String productMaterial;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        productPrice: json["product_price"],
        productOffer: json["product_offer"],
        productCategory: json["product_category"],
        productColor: json["product_color"],
        productBrand: json["product_brand"],
        productSize: json["product_size"],
        productMaterial: json["product_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": productName,
        "product_description": productDescription,
        "images": List<dynamic>.from(images.map((x) => x)),
        "product_price": productPrice,
        "product_offer": productOffer,
        "product_category": productCategory,
        "product_color": productColor,
        "product_brand": productBrand,
        "product_size": productSize,
        "product_material": productMaterial,
      };
}
