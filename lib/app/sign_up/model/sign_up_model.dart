class SignUpModel {
  SignUpModel({
    required this.userMail,
    required this.userPassword,
    required this.userName,
    required this.phoneNumber,
  });

  String userMail;
  String userName;
  int phoneNumber;
  String userPassword;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
      userMail: json["user_mail"],
      userPassword: json["user_password"],
      phoneNumber: json['user_number'] as int,
      userName: json['user_name']);

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
        "user_number": phoneNumber,
        "user_name": userName,
      };
}

class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.message,
    this.token,
  });

  bool status;
  String message;
  String? token;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
      };
}
