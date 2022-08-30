import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get_started/delivery.gif'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Lets Improve your experience',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.rasa().fontFamily),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child:
                Text('Find cool accessories to support your daily activities.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.rasa().fontFamily,
                    )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: ShopNowButton(
                screen: GlobalScreen(), textButton: 'Get Started'),
          )
        ],
      ),
    );
  }
}
