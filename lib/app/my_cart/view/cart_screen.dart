import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';
import 'widgets/products_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
    // required this.amount,
    // required this.discount,
  }) : super(key: key);
  // final String amount;
  // final String discount;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ProductCartCard(
              width: width,
            ),
            DividerWidget(
              height: height,
            ),
            ProductCartCard(
              width: width,
            ),
            DividerWidget(
              height: height,
            ),
            ProductCartCard(
              width: width,
            ),
            DividerWidget(
              height: height,
            ),
            // PriceDetails(
            //   height: height,
            //   amount: amount,
            //   discout: discount,
            // ),
            sizedBox50,
            const ShopNowButton(
              textButton: 'Place Order',
              screen: OrderSummary(),
            )
          ],
        ),
      ),
    );
  }
}

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
