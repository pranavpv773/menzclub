import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final userName = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final password = TextEditingController();
  onTabLoginFunction(
      BuildContext context, String emailFn, String passwordFn) async {
    if (formKey.currentState!.validate()) {
      return 'sucess';
    }
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
