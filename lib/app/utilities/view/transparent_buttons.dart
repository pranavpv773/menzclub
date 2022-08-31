import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/routes/routes.dart';

class GetTransparentButton extends StatelessWidget {
  const GetTransparentButton({
    Key? key,
    required this.button,
    required this.buttonBgColor,
    required this.buttonColor,
    required this.screen,
    required this.index,
  }) : super(key: key);
  final String button;
  final Color buttonColor;
  final Color buttonBgColor;
  final dynamic screen;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: primary),
        ),
        onPressed: () {
          if (index == 1) {
            RoutesProvider.nextScreen(screen: screen);
          } else {
            RoutesProvider.removeScreenUntil(screen: screen);
          }
        },
        padding: const EdgeInsets.all(10.0),
        color: buttonBgColor,
        textColor: buttonColor,
        child: Text(
          button,
          style: TextStyle(
              fontSize: 15,
              fontFamily: GoogleFonts.alice().fontFamily,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
