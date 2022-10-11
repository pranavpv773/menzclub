import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondSdcreen extends StatelessWidget {
  const SecondSdcreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get_started/packing_process.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Text(
              'Lets make your progress fast',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rasa().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Text(
              'Find cool accessories to support your daily activities.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rasa().fontFamily,
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 30.0),
          //   child:
          //       ShopNowButton(screen: ThirdScreen(), textButton: 'Get Started'),
          // )
        ],
      ),
    );
  }
}
