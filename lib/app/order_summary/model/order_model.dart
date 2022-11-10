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
    required this.orders,
    required this.status,
    required this.message,
  });

  List<Order> orders;
  bool status;
  String message;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Order {
  Order({
    this.id,
    required this.products,
    required this.totalPrice,
    required this.address,
    required this.userMail,
    this.orderedAt,
  });

  String? id;
  List<Product> products;
  int totalPrice;
  String address;
  String userMail;
  int? orderedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        products: List<Product>.from(
          json["products"].map(
            (x) => Product.fromJson(x),
          ),
        ),
        totalPrice: json["totalPrice"],
        address: json["address"],
        userMail: json["user_mail"],
        orderedAt: json["orderedAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totalPrice": totalPrice,
        "address": address,
        "user_mail": userMail,
        "orderedAt": orderedAt,
      };
}

class Product {
  Product({
    required this.productId,
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
    this.id,
  });

  String productId;
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
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
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
        "_id": id,
      };
}
