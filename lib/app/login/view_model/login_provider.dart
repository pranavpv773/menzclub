// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/login/api_service/api_services.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();

  Future<void> onTabLoginFunction() async {
    if (formKey.currentState!.validate()) {
      final data = EmailSignin(
        userMail: email.text.trim(),
        userPassword: password.text.trim(),
      );

      EmailSigninResp resp = await ApiService.login(data);

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

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
