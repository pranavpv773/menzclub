import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class ShopTransparentButton extends StatelessWidget {
  const ShopTransparentButton({
    Key? key,
    required this.button,
    required this.buttonBgColor,
    required this.buttonColor,
  }) : super(key: key);
  final String button;
  final Color buttonColor;
  final Color buttonBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: primary),
        ),
        onPressed: () {},
        padding: const EdgeInsets.all(10.0),
        color: buttonBgColor,
        textColor: buttonColor,
        child: Text(
          button,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
