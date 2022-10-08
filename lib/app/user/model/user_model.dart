// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserMainModel userMainModelFromJson(String str) =>
    UserMainModel.fromJson(json.decode(str));

String userMainModelToJson(UserMainModel data) => json.encode(data.toJson());

class UserMainModel {
  UserMainModel({
    required this.userModel,
    required this.status,
    required this.message,
  });

  List<UserModel> userModel;
  bool status;
  String message;

  factory UserMainModel.fromJson(Map<String, dynamic> json) => UserMainModel(
        userModel: List<UserModel>.from(
            json["tShirt"].map((x) => UserModel.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "userModel": List<dynamic>.from(userModel.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class UserModel {
  UserModel({
    required this.userMail,
    required this.userPassword,
    required this.userName,
    required this.userNumber,
    required this.userCart,
  });

  String userMail;
  String userPassword;
  String userName;
  int userNumber;
  List<UserCart> userCart;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userMail: json["user_mail"],
        userPassword: json["user_password"],
        userName: json["user_name"],
        userNumber: json["user_number"],
        userCart: List<UserCart>.from(
            json["user_cart"].map((x) => UserCart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
        "user_name": userName,
        "user_number": userNumber,
        "user_cart": List<dynamic>.from(userCart.map((x) => x.toJson())),
      };
}

class UserCart {
  UserCart({
    required this.quantity,
    required this.product,
  });

  int quantity;
  Product product;

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
        quantity: json["quantity"],
        product: Product.fromJson(json["Product"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "Product": product.toJson(),
      };
}

class Product {
  Product({
    required this.id,
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

  String id;
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
