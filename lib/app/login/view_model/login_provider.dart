import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/home/view/home_screen.dart';
import 'package:menz_cart_app/app/login/api_service/api_services.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/routes/routes.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  onTabLoginFunction() async {
    if (formKey.currentState!.validate()) {
      final data = EmailSignin(
          userMail: email.text.trim(), userPassword: password.text.trim());

      EmailSigninResp resp = ApiService.login(data.toJson());

      if (resp.status) {
        RoutesProvider.removeScreenUntil(screen: const GlobalScreen());
      } else {
        print(resp.message);
      }
    }
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
