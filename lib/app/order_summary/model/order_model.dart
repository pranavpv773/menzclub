// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

OrderResponseModel orderResponseModelFromJson(String str) =>
    OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) =>
    json.encode(data.toJson());

class OrderResponseModel {
  OrderResponseModel({
    this.order,
    this.status,
    this.message,
  });

  Order? order;
  bool? status;
  String? message;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        order: Order.fromJson(json["order"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "order": order!.toJson(),
        "status": status,
        "message": message,
      };
}

class Order {
  Order({
    this.products,
    this.totalPrice,
    this.address,
    this.userMail,
    this.orderedAt,
    this.id,
  });

  List<Product>? products;
  int? totalPrice;
  String? address;
  String? userMail;
  int? orderedAt;
  String? id;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        totalPrice: json["totalPrice"],
        address: json["address"],
        userMail: json["user_mail"],
        orderedAt: json["orderedAt"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "address": address,
        "user_mail": userMail,
        "orderedAt": orderedAt,
        "_id": id,
      };
}

class Product {
  Product({
    this.productId,
    this.productName,
    this.productDescription,
    this.images,
    this.productPrice,
    this.productOffer,
    this.productCategory,
    this.productColor,
    this.productBrand,
    this.productSize,
    this.productMaterial,
    this.productDate,
    this.id,
  });

  String? productId;
  String? productName;
  String? productDescription;
  List<String>? images;
  int? productPrice;
  int? productOffer;
  String? productCategory;
  String? productColor;
  String? productBrand;
  int? productSize;
  String? productMaterial;
  DateTime? productDate;
  String? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
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
        productDate: DateTime.parse(json["product_date"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_description": productDescription,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "product_price": productPrice,
        "product_offer": productOffer,
        "product_category": productCategory,
        "product_color": productColor,
        "product_brand": productBrand,
        "product_size": productSize,
        "product_material": productMaterial,
        "product_date": productDate!.toIso8601String(),
        "_id": id,
      };
}
