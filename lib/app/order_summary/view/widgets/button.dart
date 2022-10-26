import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/payment/view_model/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ShopTransparentButton extends StatelessWidget {
  const ShopTransparentButton({
    Key? key,
    required this.button,
    required this.buttonBgColor,
    required this.buttonColor,
    required this.amount,
    required this.fn,
  }) : super(key: key);
  final String button;
  final Color buttonColor;
  final Color buttonBgColor;
  final int amount;
  final VoidCallback fn;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentProvider>().razorpay = Razorpay();
      context.read<PaymentProvider>().razorpay.on(
            Razorpay.EVENT_PAYMENT_SUCCESS,
            context.read<PaymentProvider>().handlePaymentSuccess,
          );
      context.read<PaymentProvider>().razorpay.on(
            Razorpay.EVENT_PAYMENT_ERROR,
            context.read<PaymentProvider>().handlePaymentError,
          );
      context.read<PaymentProvider>().razorpay.on(
            Razorpay.EVENT_EXTERNAL_WALLET,
            context.read<PaymentProvider>().handleExternalWallet,
          );
    });
    return Consumer<PaymentProvider>(builder: (context, value, _) {
      return Container(
        margin: const EdgeInsets.all(10),
        height: 50.0,
        // ignore: deprecated_member_use
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(
              color: AppColor.primary,
            ),
          ),
          onPressed: fn,
          padding: const EdgeInsets.all(
            10.0,
          ),
          color: buttonBgColor,
          textColor: buttonColor,
          child: Text(
            button,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
    });
  }
}
