import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/utilities/view_model/service_utility.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/get_started/delivery_bg.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Lets get the fastest delivery experience',
              style: TextStyle(
                color: primary2,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rasa().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Find the cool accessories to support your daily activities.',
              style: TextStyle(
                color: kWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rasa().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kWhite),
                ),
                onPressed: () {
                  context
                      .read<ServicesProvider>()
                      .settingModalBottomSheet(context);
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(color: primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
