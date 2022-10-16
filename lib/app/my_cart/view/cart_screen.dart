import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/products_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: context.read<LoginProvider>().isLogged
          ? LoginCartScreen(
              width: width,
              height: height,
            )
          : SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextStyleWidget(
                    text: "Please Login and add products to cart",
                  ),
                  Image.asset(
                    "assets/lottee/emptyCartr.gif",
                  ),
                ],
              ),
            ),
    );
  }
}

class LoginCartScreen extends StatelessWidget {
  const LoginCartScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
