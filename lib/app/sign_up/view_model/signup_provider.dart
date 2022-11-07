// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/otp_verification/view/otp_screen.dart';
import 'package:menz_cart_app/app/sign_up/api_services/api_services.dart';
import 'package:menz_cart_app/app/sign_up/model/sign_up_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/routes/routes.dart';

class SignUpProvider with ChangeNotifier {
  final signUpKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  static String otpToken = '';
  signUp(
    BuildContext context,
  ) async {
    log('Reached');
    if (signUpKey.currentState!.validate()) {
      log(password.text);
      log(confirmPassword.text);
      if (password.text == confirmPassword.text) {
        final data = SignUpModel(
          userMail: email.text,
          userPassword: password.text,
          userName: userName.text,
          phoneNumber: int.parse(phoneNumber.text),
        );

        SignUpResponse? resp = await SignupApiService().signUp(data);
        if (resp!.status) {
          otpToken = resp.id!;
          Fluttertoast.showToast(
            msg: resp.message,
            toastLength: Toast.LENGTH_LONG,
          );
          RoutesProvider.nextScreen(
            screen: const OtpVerificationScreen(),
          );
          // disposeControll();
        } else {
          Fluttertoast.showToast(
            msg: resp.message,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Password not matching",
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  disposeControll() {
    userName.clear();
    phoneNumber.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
