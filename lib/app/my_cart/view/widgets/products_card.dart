import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
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
                        children: const [
                          IconStared(),
                          IconStared(),
                          IconStared(),
                          Icon(Icons.star_border),
                          Icon(Icons.star_border),
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
                                  color: kRed,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: ' \$3.99',
                                style: TextStyle(
                                  color: kGreen,
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
                        style: TextStyle(fontSize: 16, color: kGreen),
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
                  buttonBgColor: kWhite,
                  buttonColor: kRed,
                ),
                ShopTransparentButton(
                  button: 'Buy this now ',
                  buttonBgColor: kWhite,
                  buttonColor: kGreen,
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
  const IconStared({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.star,
      color: Color.fromARGB(255, 22, 91, 24),
    );
  }
}
