class EmailSignin {
  EmailSignin({
    required this.userMail,
    required this.userPassword,
  });

  String userMail;
  String userPassword;

  factory EmailSignin.fromJson(Map<String, dynamic> json) => EmailSignin(
        userMail: json["user_mail"],
        userPassword: json["user_password"],
      );

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

class EmailSigninResp {
  EmailSigninResp({
    required this.status,
    required this.message,
    this.token,
  });

  bool status;
  String message;
  String? token;

  factory EmailSigninResp.fromJson(Map<String, dynamic> json) =>
      EmailSigninResp(
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
