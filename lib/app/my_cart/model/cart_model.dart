// To parse this JSON data, do
//
//     final cartRespoModel = cartRespoModelFromJson(jsonString);

import 'dart:convert';

CartRespoModel cartRespoModelFromJson(String str) =>
    CartRespoModel.fromJson(json.decode(str));

String cartRespoModelToJson(CartRespoModel data) => json.encode(data.toJson());

class CartRespoModel {
  CartRespoModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory CartRespoModel.fromJson(Map<String, dynamic> json) => CartRespoModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
