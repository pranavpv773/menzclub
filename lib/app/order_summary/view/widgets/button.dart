import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/payment/view/payment_screen.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ShopTransparentButton extends StatelessWidget {
  const ShopTransparentButton({
    Key? key,
    required this.button,
    required this.buttonBgColor,
    required this.buttonColor,
    required this.amount,
  }) : super(key: key);
  final String button;
  final Color buttonColor;
  final Color buttonBgColor;
  final int amount;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentScreenProvider>().razorpay = Razorpay();
      context.read<PaymentScreenProvider>().razorpay.on(
            Razorpay.EVENT_PAYMENT_SUCCESS,
            context.read<PaymentScreenProvider>().handlePaymentSuccess,
          );
      context.read<PaymentScreenProvider>().razorpay.on(
            Razorpay.EVENT_PAYMENT_ERROR,
            context.read<PaymentScreenProvider>().handlePaymentError,
          );
      context.read<PaymentScreenProvider>().razorpay.on(
            Razorpay.EVENT_EXTERNAL_WALLET,
            context.read<PaymentScreenProvider>().handleExternalWallet,
          );
    });
    return Consumer<PaymentScreenProvider>(builder: (context, value, _) {
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
          onPressed: () {
            RoutesProvider.nextScreen(
                screen: ProductsScreen(
                    title: "All Products",
                    list: AppColor
                        .rootScaffoldMessengerKey.currentState!.context
                        .read<ProductsProvider>()
                        .allProducts));
          },
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
