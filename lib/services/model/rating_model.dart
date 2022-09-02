class Rating {
  final double? rate;
  final int? count;
  Rating({this.rate, this.count});
  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );
  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}
