import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'widgets/button.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: const Text('Order Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/lottee/emptyCart1.gif'),
            const Text(
              "You haven't placed any order yet!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Order section is empty. After placing order,You can track them from here!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ShopTransparentButton(
              buttonBgColor: Colors.transparent.withOpacity(0.1),
              buttonColor: primary,
              button: "START SHOPPING",
            ),
          ],
        ),
      ),
    );
  }
}
