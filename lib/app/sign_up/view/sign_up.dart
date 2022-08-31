import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/sign_up/view/widgets/profile_pic_card.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SignUpProvider>().disposeControll();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            color: primary1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AvatharCard(),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
