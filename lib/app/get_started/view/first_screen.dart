import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 153, 169),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get_started/shopping_bg.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Text(
              'Lets Improve your experience',
              style: TextStyle(
                color: AppColor.kWhite,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.b612().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Text(
              'Menswear Founded on Fit, Built on Service, and Focused on Style. However You Fit, Menzclub Fits You.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.shanti().fontFamily,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
