import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';

import 'widgets/price_details.dart';
import 'widgets/products_card.dart';

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
            PriceDetails(
              height: height,
            ),
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
