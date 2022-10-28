// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/login/api_service/api_services.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  bool isLogged = false;
  bool onLoad = false;

  Future<void> onTabLoginFunction(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      onLoad = true;
      notifyListeners();
      log('login');
      final data = EmailSignin(
        userMail: email.text.trim(),
        userPassword: password.text.trim(),
      );

      EmailSigninResp resp = await ApiService().login(data);

      if (resp.status) {
        context
            .read<UserProvider>()
            .onTabGetUser(email.text)
            .then((value) async {
          isLogged = true;
          context.read<CartNotifier>().fetchUserCart(context);
          Fluttertoast.showToast(
            msg: resp.message,
            toastLength: Toast.LENGTH_LONG,
          );
          RoutesProvider.removeScreenUntil(
            screen: const GlobalScreen(),
          );
        });
      } else {
        onLoad = false;
        notifyListeners();
        isLogged = false;
        Fluttertoast.showToast(
          msg: resp.message,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    }
  }

  logOut() {
    isLogged = false;
    notifyListeners();
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
