import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: kWhite,
        child: Center(
          child: Image.asset(
            'assets/logo3.png',
          ),
        ),
      ),
    );
  }
}
