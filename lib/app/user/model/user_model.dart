import 'dart:convert';

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
    required this.address,
  });

  String? id;
  String userMail;
  String userName;
  int userNumber;
  String userPassword;
  String address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        userMail: json["user_mail"],
        userName: json["user_name"],
        userNumber: json["user_number"],
        userPassword: json["user_password"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_mail": userMail,
        "user_name": userName,
        "user_number": userNumber,
        "user_password": userPassword,
        "address": address,
      };
  User copyWith({
    String? id,
    String? userMail,
    String? userName,
    int? userNumber,
    String? userPassword,
    String? address,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userMail: userMail ?? this.userMail,
      userPassword: userPassword ?? this.userPassword,
      address: address ?? this.address,
      userNumber: userNumber ?? this.userNumber,
    );
  }
}
