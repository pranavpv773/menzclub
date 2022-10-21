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
  List<dynamic> userCart;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        userMail: json["user_mail"],
        userCart: List<dynamic>.from(json["user_cart"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_mail": userMail,
        "user_cart": List<dynamic>.from(userCart.map((x) => x)),
      };
}
