import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/splash/view_model/splash_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashProvider>(context, listen: false).goHome(context);
    });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: AppColor.primary1,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: FadeInDown(
                  child: Image.asset(
                    'assets/mc.png',
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height / 2.5,
              left: 0,
              right: 0,
              child: Center(
                  child: FadeInLeft(
                child: Text(
                  'MENZCLUB',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.cousine().fontFamily,
                    color: const Color.fromARGB(255, 195, 143, 10),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
