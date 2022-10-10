// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/otp_verification/view_model/otp_provider.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.size,
    required this.text,
    // required this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: size.height * 0.40),
        child: SizedBox(
          width: size.width * 0.5,
          height: 50.0,
          child: RaisedButton(
            elevation: 10.0,
            color: AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            onPressed: () {
              context.read<OtpVerifyProvider>().otpVerifing(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
                Card(
                  color: AppColor.kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      35.0,
                    ),
                  ),
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
