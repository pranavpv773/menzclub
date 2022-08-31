import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/login/view/login.dart';
import 'package:menz_cart_app/app/utilities/view/transparent_buttons.dart';

class HomeModalBottom extends StatelessWidget {
  const HomeModalBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amberAccent,
      ),
      height: height / 4,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Do you want to continue without Login? ",
              style: TextStyle(
                  fontSize: 30,
                  color: kWhite,
                  fontFamily: GoogleFonts.firaSansCondensed().fontFamily),
            ),
          ),
          Divider(thickness: 2, color: primary),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetTransparentButton(
                  index: 1,
                  button: 'LOGIN',
                  buttonBgColor: kWhite,
                  buttonColor: primary,
                  screen: LoginScreen()),
              GetTransparentButton(
                  index: 2,
                  button: 'CONTINUE',
                  buttonBgColor: kWhite,
                  buttonColor: primary,
                  screen: GlobalScreen())
            ],
          )
        ],
      ),
    );
  }
}
