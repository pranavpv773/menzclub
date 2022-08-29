import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ProductCartCard(width: width),
            DividerWidget(height: height),
            ProductCartCard(width: width),
            DividerWidget(height: height),
            ProductCartCard(width: width),
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color.fromARGB(182, 158, 158, 158),
      thickness: height / 100,
    );
  }
}

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
                'assets/shoes/casuals.png',
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
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 22, 91, 24),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 22, 91, 24),
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 22, 91, 24),
                          ),
                          Icon(Icons.star_border),
                          Icon(Icons.star_border),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '\$8.99',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: ' \$3.99',
                                style: TextStyle(
                                  color: Colors.green,
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
                      const Text(
                        'Free Delivery',
                        style: TextStyle(fontSize: 16, color: Colors.green),
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
                  buttonColor: Colors.red,
                ),
                ShopTransparentButton(
                  button: 'Buy this now ',
                  buttonBgColor: kWhite,
                  buttonColor: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
