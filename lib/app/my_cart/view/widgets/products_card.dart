import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/tshirt/tshirt1.png',
                width: width / 3,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sports Shoes 131 upto djfkjjfdjk',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Text('Multi color'),
                      Row(
                        children: [
                          IconStared(
                            width: width,
                            star: 4,
                            color: const Color.fromARGB(255, 22, 91, 24),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '\$8.99',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.kRed,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: ' \$3.99',
                                style: TextStyle(
                                  color: AppColor.kGreen,
                                ),
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
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShopTransparentButton(
                  button: 'Remove ',
                  buttonBgColor: AppColor.kWhite,
                  buttonColor: AppColor.kRed,
                ),
                ShopTransparentButton(
                  button: 'Buy this now ',
                  buttonBgColor: AppColor.kWhite,
                  buttonColor: AppColor.kGreen,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconStared extends StatelessWidget {
  const IconStared(
      {Key? key, required this.color, required this.star, required this.width})
      : super(key: key);
  final Color color;
  final double star;
  final double width;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: star,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }
}
