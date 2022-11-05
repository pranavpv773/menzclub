import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'app/app_style/color_style.dart';
import 'app/splash/view/splash_screen.dart';
import 'app/utilities/providers/provider_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderClass(
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        scaffoldMessengerKey: AppColor.rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.kWhite,
          fontFamily: GoogleFonts.mulish().fontFamily,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
