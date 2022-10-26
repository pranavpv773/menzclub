import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/payment/view_model/payment_screen.dart';
import 'package:provider/provider.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PaymentProvider>(context, listen: false).goBack(context);
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/lottee/payment-successfull.gif",
            ),
          ),
        ),
      ),
    );
  }
}
