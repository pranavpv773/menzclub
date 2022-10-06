import 'dart:convert';

WatchModels watchModelFromJson(String str) =>
    WatchModels.fromJson(json.decode(str));

String watchModelsToJson(WatchModels data) => json.encode(data.toJson());

class WatchModels {
  WatchModels({
    required this.watch,
    required this.status,
    required this.message,
  });

  List<Watch> watch;
  bool status;
  String message;

  factory WatchModels.fromJson(Map<String, dynamic> json) => WatchModels(
        watch: List<Watch>.from(json["watch"].map((x) => Watch.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "watch": List<dynamic>.from(watch.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Watch {
  Watch({
    this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.offer,
    required this.category,
    required this.collection,
    required this.color,
    required this.brand,
    required this.fit,
    required this.size,
    required this.material,
  });

  String? id;
  String name;
  String description;
  List<String> images;
  int price;
  int offer;
  String category;
  String collection;
  String color;
  String brand;
  String fit;
  int size;
  String material;

  factory Watch.fromJson(Map<String, dynamic> json) => Watch(
        id: json["_id"],
        name: json["watch_name"],
        description: json["watch_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        price: json["watch_price"],
        offer: json["watch_offer"],
        category: json["watch_category"],
        collection: json["watch_collection"],
        color: json["watch_color"],
        brand: json["watch_brand"],
        fit: json["watch_fit"],
        size: json["watch_size"],
        material: json["watch_material"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "watch_name": name,
        "watch_description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "watch_price": price,
        "watch_offer": offer,
        "watch_category": category,
        "watch_collection": collection,
        "watch_color": color,
        "watch_brand": brand,
        "watch_fit": fit,
        "watch_size": size,
        "watch_material": material,
      };
}
