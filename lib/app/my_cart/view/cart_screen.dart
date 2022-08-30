import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ProductCartCard(width: width),
            DividerWidget(height: height),
            ProductCartCard(width: width),
            DividerWidget(height: height),
            ProductCartCard(width: width),
            DividerWidget(height: height),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price Details',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Price(${2})'),
                      Text('9,028'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Discount'),
                      Text(
                        '3,694',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Delivery Charges'),
                      Text(
                        'Free Delivery',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  DividerWidget(
                    height: height / 2,
                    indent: 10,
                    lastIndent: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '5,023',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  sizedBox50,
                  const ShopNowButton(textButton: 'Place Order')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DividerWidget extends StatelessWidget {
  DividerWidget({
    Key? key,
    required this.height,
    this.indent,
    this.lastIndent,
  }) : super(key: key);

  final double height;
  final double? indent;
  final double? lastIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color.fromARGB(182, 158, 158, 158),
      thickness: height / 100,
      indent: indent ?? 0,
      endIndent: lastIndent ?? 0,
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
