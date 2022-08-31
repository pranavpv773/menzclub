import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get_started/shopping_bg.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Lets Improve your experience',
              style: TextStyle(
                color: kWhite,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.b612().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Find cool accessories to support your daily activities.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.shanti().fontFamily,
                color: Colors.amber,
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 30.0),
          //   child: ShopNowButton(
          //       screen: SecondSdcreen(), textButton: 'Get Started'),
          // )
        ],
      ),
    );
  }
}