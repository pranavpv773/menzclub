class OtpModel {
  OtpModel({
    required this.id,
    required this.userOtp,
  });

  String userOtp;
  String id;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        userOtp: json["user_otp"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_otp": userOtp,
        "_id": id,
      };
}

class OtpVerifyResponse {
  OtpVerifyResponse({
    required this.status,
    required this.message,
    this.jwt,
  });

  bool status;
  String message;
  String? jwt;

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      OtpVerifyResponse(
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        jwt: json["jwt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "jwt": jwt,
      };
}
