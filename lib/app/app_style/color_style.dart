import 'package:flutter/material.dart';

class AppColor {
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static Color kWhite = Colors.white;
  static Color kBlack = Colors.black;
  static Color primary = const Color.fromARGB(224, 78, 88, 151);
  static Color primary1 = const Color.fromARGB(89, 156, 168, 250);
  static Color primary2 = const Color.fromARGB(255, 14, 33, 159);
  static Color kGrey = const Color.fromARGB(182, 158, 158, 158);
  static Color kGreen = Colors.green;
  static Color kRed = Colors.red;
  static Color secondary = const Color.fromARGB(38, 158, 158, 158);
  static final colorList = [
    const Color.fromARGB(255, 237, 22, 7),
    Colors.blue,
    Colors.black,
    Colors.greenAccent,
    Colors.yellow,
    Colors.white,
    Colors.purple,
  ];
}
