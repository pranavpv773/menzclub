// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/otp_verification/api_services/api_services.dart';
import 'package:menz_cart_app/app/otp_verification/model/otp_model.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class OtpVerifyProvider with ChangeNotifier {
  final otpController = TextEditingController();
  otpVerifing(
    BuildContext context,
  ) async {
    log('Reached');
    log(SignUpProvider.otpToken);
    final otp = otpController.text;
    log(otpController.text);

    final data = OtpModel(
      id: SignUpProvider.otpToken,
      userOtp: otp,
    );
    log(data.id);
    OtpVerifyResponse resp = await OtpApiService().otpVerified(
      data,
    );

    if (resp.status) {
      context
          .read<UserProvider>()
          .onTabGetUser(context.read<SignUpProvider>().email.text)
          .then((value) async {
        context.read<LoginProvider>().isLogged = true;
        notifyListeners();
        context.read<CartNotifier>().fetchUserCart(context);
      });
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
      RoutesProvider.removeScreenUntil(
        screen: const GlobalScreen(),
      );
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
