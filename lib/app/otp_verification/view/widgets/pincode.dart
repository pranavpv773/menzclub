import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/otp_verification/view_model/otp_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PinCodeFieldWidget extends StatelessWidget {
  const PinCodeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20.0,
      ),
      // color: kPrimary,
      // width: 50, height: 50,
      child: Form(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 30,
            ),
            child: PinCodeTextField(
              autoDisposeControllers: false,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              obscureText: true,
              obscuringCharacter: '👕',
              // obscuringWidget: Image.asset(
              //   'assets/mc.png',
              //   width: 150,
              //   height: 100,
              // ),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.isEmpty) {
                  return "please fill all fields";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(
                  5,
                ),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(
                milliseconds: 300,
              ),
              enableActiveFill: true,
              // errorAnimationController: errorController,
              controller: context.read<OtpVerifyProvider>().otpController,
              keyboardType: TextInputType.number,

              boxShadows: const [
                BoxShadow(
                  offset: Offset(
                    0,
                    1,
                  ),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {},
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                debugPrint(value);
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            )),
      ),
    );
  }
}
