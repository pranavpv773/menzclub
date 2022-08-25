import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/global/view/global_screen.dart';
import 'package:provider/provider.dart';

import 'global/view_model/global_provider.dart';

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
          create: (crete) => GlobalProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kWhite,
          primarySwatch: Colors.blue,
        ),
        home: const GlobalScreen(),
      ),
    );
  }
}
