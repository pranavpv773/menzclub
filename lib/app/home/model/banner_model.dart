// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.banner,
    required this.status,
    required this.message,
  });

  List<Banners> banner;
  bool status;
  String message;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner:
            List<Banners>.from(json["banner"].map((x) => Banners.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Banners {
  Banners({
    this.id,
    required this.bannerCategory,
    required this.images,
  });

  String? id;
  String bannerCategory;
  List<String> images;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json["_id"],
        bannerCategory: json["banner_category"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "banner_category": bannerCategory,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
