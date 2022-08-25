import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/home/view/home_screen.dart';
import 'package:menz_cart_app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

import 'splash/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (crete) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kWhite,
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
