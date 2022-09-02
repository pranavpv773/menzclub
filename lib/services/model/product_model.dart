import 'rating_model.dart';

class ProductsModel {
  final int? id;
  final String? title;
  final double price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  ProductsModel({
    this.id,
    this.title,
    required this.price,
    this.image,
    this.description,
    this.category,
    this.rating,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating!.toJson(),
      };
}
