// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:menz_cart_app/app/user/model/prodout_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.status,
    required this.message,
  });

  List<User> user;
  bool status;
  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class User {
  User({
    this.id,
    required this.userMail,
    required this.userName,
    required this.userNumber,
    required this.userPassword,
    required this.userIsVerified,
    required this.userDate,
    required this.address,
    this.userCart,
  });

  String? id;
  String userMail;
  String userName;
  int userNumber;
  String userPassword;
  bool userIsVerified;
  DateTime userDate;
  String address;
  List<UserCart>? userCart;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userMail: json["user_mail"],
        userName: json["user_name"],
        userNumber: json["user_number"],
        userPassword: json["user_password"],
        userIsVerified: json["user_isVerified"],
        userDate: DateTime.parse(json["user_date"]),
        address: json["address"],
        userCart: List<UserCart>.from(
            json["user_cart"].map((x) => UserCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_mail": userMail,
        "user_name": userName,
        "user_number": userNumber,
        "user_password": userPassword,
        "user_isVerified": userIsVerified,
        "user_date": userDate.toIso8601String(),
        "address": address,
        "user_cart": List<dynamic>.from(userCart!.map((x) => x.toJson())),
      };
}

class UserCart {
  UserCart({
    required this.quantity,
    required this.product,
  });

  int quantity;

  List<Product> product;

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
        quantity: json["quantity"],
        product: List<Product>.from(json["product"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": List<dynamic>.from(product.map((x) => x)),
      };
}
