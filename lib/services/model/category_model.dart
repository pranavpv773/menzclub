class AllProducts {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  AllProducts(
      {this.id,
      this.description,
      this.category,
      this.images,
      this.price,
      this.title});
}

class Category {
  int? id;
  Name? name;
  String? image;
  Category({this.id, this.image, this.name});
}

enum Name { furniture, clothes, electronics, shoes, others }
