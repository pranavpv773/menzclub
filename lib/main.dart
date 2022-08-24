import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';

import 'splash/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kWhite,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
