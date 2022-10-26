import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/payment/view_model/payment_screen.dart';
import 'package:provider/provider.dart';

class UnSuccessScreen extends StatelessWidget {
  const UnSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PaymentProvider>(context, listen: false).goBack(context);
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: height / 2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/lottee/failed.gif",
                ),
              ),
            ),
          ),
          Text(
            "Payment Failed",
            style: AppTextStyles.h2,
          )
        ],
      ),
    );
  }
}
