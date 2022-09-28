// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/otp_verification/api_services/api_services.dart';
import 'package:menz_cart_app/app/otp_verification/model/otp_model.dart';
import 'package:menz_cart_app/app/sign_up/api_services/api_services.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpVerifyProvider with ChangeNotifier {
  final otpController = TextEditingController();
  void otpVerifing(
    BuildContext context,
  ) async {
    log('Reached');

    log('get in to form');
    log(otpController.text);

    log('get in to password');
    final data =
        OtpModel(id: SignUpProvider.otpToken, userOtp: otpController.text);
    log(data.id);
    EmailSigninResp resp = await OtpApiService.otpVerified(data);

    if (resp.status) {
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
