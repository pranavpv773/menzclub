import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/sign_up/view/sign_up.dart';
import 'package:menz_cart_app/routes/routes.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        RoutesProvider.nextScreen(
          screen: const SignUpScreen(),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: 15,
        ),
      ),
    );
  }
}
