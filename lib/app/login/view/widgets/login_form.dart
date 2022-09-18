// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
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
            padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
            child: TextFormField(
              validator: (input) =>
                  context.read<LoginProvider>().isValidEmail(input!)
                      ? null
                      : "Check your email",
              keyboardType: TextInputType.emailAddress,
              controller: context.read<LoginProvider>().email,
              style: TextStyle(
                color: kGrey,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                fillColor: kWhite,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.mail,
                    color: primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primary,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: kGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return " Please fill this field";
                } else if (value.length < 5) {
                  return " Password is less than six";
                }
              },
              controller: context.read<LoginProvider>().password,
              style: TextStyle(
                color: kGrey,
                fontSize: 18,
              ),
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                fillColor: kWhite,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Icon(
                    Icons.key,
                    color: primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: primary,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2.0,
                  ),
                ),
                hintText: "password",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: kGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                // LoginTextButton(
                //   text: 'Forgot Password ?',
                // ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 15,
                    ),
                    primary: primary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onPressed: (() async {
                    context.read<LoginProvider>().onTabLoginFunction();
                  }),
                  child: const Text(
                    "LOGIN",
                  ),
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(top: 18.0),
              //   child: Center(
              //     child: Text(
              //       "OR",
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: const [
              //     Padding(
              //       padding: EdgeInsets.only(top: 13.0),
              //       child: SocialIcons(
              //         primary: Colors.blue,
              //         text: ' GOOGLE',
              //       ),
              //     ),
              //     Padding(
              //       padding: EdgeInsets.only(top: 13.0),
              //       child: SocialIcons(
              //         primary: Colors.black,
              //         text: ' TWITTER',
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
