import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    Key? key,
    required this.name,
    required this.discount,
    required this.topcollection,
    required this.star,
    required this.price,
  }) : super(key: key);
  final String discount;
  final String name;
  final String topcollection;
  final double star;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              name,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          RatingBarIndicator(
            rating: star,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '\$$price',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.kRed,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  TextSpan(
                    text: ' \$ ${int.parse(price) - int.parse(discount)}',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Deliver in 2 Days,Fri',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Free Delivery',
            style: TextStyle(fontSize: 16, color: AppColor.kGreen),
          ),
        ],
      ),
    );
  }
}
