import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/get_started/view_model/liquid_provider.dart';
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
          Image.asset(
            'assets/get_started/delivery_bg.gif',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Text(
              'Lets get the fastest delivery experience',
              style: TextStyle(
                color: AppColor.primary2,
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
              'Find the cool accessories to support your daily activities.',
              style: TextStyle(
                color: AppColor.kWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.rasa().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 38.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.kWhite,
                  ),
                ),
                onPressed: () {
                  context.read<LiquidProvider>().screeFunction(context);
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
