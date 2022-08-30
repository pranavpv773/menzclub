import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:provider/provider.dart';
import 'app/constants/colors.dart';
import 'app/global/view/global_screen.dart';
import 'app/home/view_model/home_provider.dart';
import 'routes/routes.dart';

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
        ChangeNotifierProvider(
          create: (crete) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ProductsProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kWhite,
          fontFamily: GoogleFonts.mulish().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: const GlobalScreen(),
      ),
    );
  }
}
