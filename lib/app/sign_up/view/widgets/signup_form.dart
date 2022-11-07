import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/sign_up/view/widgets/password_form.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:provider/provider.dart';
import 'text_form.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("form");
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: context.read<SignUpProvider>().signUpKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // const ImageProfileAdd(),
              SignUpTextforms(
                icon: Icons.person_outline_outlined,
                text: "UserName",
                obscureText: false,
                //   vertical: 20,
                controller: context.read<SignUpProvider>().userName,
              ),
              SignUpTextforms(
                icon: Icons.mail_outline_sharp,
                text: "Email",
                obscureText: false,
                //   vertical: 15,
                controller: context.read<SignUpProvider>().email,
              ),
              SignUpTextforms(
                icon: Icons.send_to_mobile_rounded,
                text: "Phone",
                obscureText: false,
                //  vertical: 15,
                controller: context.read<SignUpProvider>().phoneNumber,
              ),
              PasswordTextforms(
                icon: Icons.lock_outline,
                text: "Password",
                obscureText: true,
                //  vertical: 15,
                controller: context.read<SignUpProvider>().password,
              ),
              PasswordTextforms(
                icon: Icons.lock_reset_outlined,
                text: "Confirm Password",
                obscureText: true,
                //  vertical: 15,
                controller: context.read<SignUpProvider>().confirmPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 15,
                    ),
                    primary: AppColor.primary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<SignUpProvider>().signUp(
                          context,
                        );
                  },
                  child: const Text(
                    "SIGN UP",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
