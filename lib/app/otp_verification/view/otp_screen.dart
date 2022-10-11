import 'package:flutter/material.dart';

import 'widgets/button.dart';
import 'widgets/card_widget.dart';
import 'widgets/lottie_img.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          const LottieImageWidget(),
          Stack(
            children: [
              Container(
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(
                        0.1,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        2.0,
                        5.0,
                      ),
                    ),
                  ],
                ),
                child: const CardWidget(),
              ),
              Button(
                key: key,
                size: size,
                text: "Continue",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
