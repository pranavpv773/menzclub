import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/sign_up/view/widgets/profile_pic_card.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: AppColor.primary1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
