import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/splash/view_model/splash_screen.dart';
import 'package:provider/provider.dart';

class NointernetScreen extends StatelessWidget {
  const NointernetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            height: 300,
            decoration: BoxDecoration(
              color: AppColor.kWhite,
              image: const DecorationImage(
                image: AssetImage(
                  "assets/lottee/no_network.jpeg",
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Please check your Internet connectivity\n and try again",
                style: AppTextStyles.h3,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<SplashProvider>().goHome(context);
            },
            child: context.watch<SplashProvider>().checkingButton == true
                ? Text(
                    "Checking.....",
                    style: AppTextStyles.h2,
                  )
                : Text(
                    "Retry",
                    style: AppTextStyles.h2,
                  ),
          ),
        ],
      ),
    );
  }
}
