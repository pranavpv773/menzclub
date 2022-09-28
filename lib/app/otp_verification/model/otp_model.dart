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
