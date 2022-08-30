import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/my_cart/view/cart_screen.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextStyleWidget(
            text: 'Price Details',
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
            children: [
              const Text('Discount'),
              Text(
                '3,694',
                style: TextStyle(color: kGreen),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Delivery Charges'),
              Text(
                'Free Delivery',
                style: TextStyle(color: kGreen),
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
              TextStyleWidget(
                text: 'Total Amount',
              ),
              TextStyleWidget(
                text: '5,023',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
