// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class LoginTextforms extends StatelessWidget {
  const LoginTextforms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginProvider>().formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 40,
              left: 40,
            ),
            child: TextFormField(
              validator: (input) =>
                  context.read<LoginProvider>().isValidEmail(input!)
                      ? null
                      : "Check your email",
              keyboardType: TextInputType.emailAddress,
              controller: context.read<LoginProvider>().email,
              style: AppTextStyles.formField,
              decoration: InputDecoration(
                fillColor: AppColor.kWhite,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Icon(
                    Icons.mail,
                    color: AppColor.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: AppColor.kGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 40,
              left: 40,
            ),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return " Please fill this field";
                } else if (value.length < 5) {
                  return " Password is less than six";
                }
              },
              controller: context.read<LoginProvider>().password,
              style: AppTextStyles.formField,
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                fillColor: AppColor.kWhite,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Icon(
                    Icons.key,
                    color: AppColor.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: BorderSide(
                    color: AppColor.primary,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: "password",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: AppColor.kGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // LoginTextButton(
                //   text: 'Forgot Password ?',
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 28.0,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150,
                  vertical: 15,
                ),
                primary: AppColor.primary,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              onPressed: (() async {
                context.read<LoginProvider>().onTabLoginFunction(context);
              }),
              child: context.watch<LoginProvider>().onLoad
                  ? const Text("loading......")
                  : const Text(
                      "LOGIN",
                    ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
