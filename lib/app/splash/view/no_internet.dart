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
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.primary1,
          image: const DecorationImage(
            image: AssetImage("assets/lottee/no_internet.png"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Please check your Internet",
              style: AppTextStyles.h2,
            ),
            TextButton(
              onPressed: () {
                context.read<SplashProvider>().goHome(context);
              },
              child: Text(
                "Try Again",
                style: AppTextStyles.h2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
