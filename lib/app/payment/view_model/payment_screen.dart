import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/payment/view/success_screen.dart';
import 'package:menz_cart_app/app/payment/view/unsuccess_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentProvider with ChangeNotifier {
  late Razorpay razorpay;

  // void dispose() {
  //   super.dispose();
  //   razorpay.clear();
  // }

  void openCheckout(int amount, String name) async {
    log(AppTextStyles.payName.toString());
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': amount * 100,
      'name': 'MenzClub',
      'description': name,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '${AppTextStyles.payName}',
        'email': AppTextStyles.payEmail,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint(
        Razorpay.UNKNOWN_ERROR.toString(),
      );
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    RoutesProvider.nextScreen(screen: const SuccessScreen());
  }

  void handlePaymentError(PaymentFailureResponse response) {
    RoutesProvider.nextScreen(screen: const UnSuccessScreen());
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: ${response.walletName!}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  Future<void> goBack(BuildContext context) async {
    //await getToHome(context);
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then((value) => RoutesProvider.removeScreenUntil(
          screen: const GlobalScreen(),
        ));
  }
}
