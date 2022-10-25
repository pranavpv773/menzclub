// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.cart,
    required this.status,
    required this.message,
  });

  List<Cart> cart;
  bool status;
  String message;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Cart {
  Cart({
    this.id,
    required this.userMail,
    required this.userCart,
  });

  String? id;
  String userMail;
  List<UserCart> userCart;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        userMail: json["user_mail"],
        userCart: List<UserCart>.from(
            json["user_cart"].map((x) => UserCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_mail": userMail,
        "user_cart": List<dynamic>.from(userCart.map((x) => x.toJson())),
      };
}

class UserCart {
  UserCart({
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
    required this.id,
  });
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
  String id;

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
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
        id: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
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
        "product_id": id,
      };
}
