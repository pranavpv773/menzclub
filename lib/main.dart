import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/description/view_model/description_provider.dart';
import 'package:menz_cart_app/app/get_started/view_model/liquid_provider.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider_two.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider.dart';
import 'package:menz_cart_app/app/otp_verification/view_model/otp_provider.dart';
import 'package:menz_cart_app/app/payment/view/payment_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/app/search/view_model/search_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider_two.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:menz_cart_app/app/splash/view/splash_screen.dart';
import 'package:menz_cart_app/app/splash/view_model/splash_screen.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt_provider_two.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider_two.dart';
import 'package:menz_cart_app/app/utilities/view_model/service_utility.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:provider/provider.dart';
import 'app/home/view_model/home_provider.dart';
import 'app/shoes/view_model/shoes_provider_two.dart';
import 'app/watches/view_model/watch_provider_two.dart';
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
          create: (crete) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => LiquidProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => GlobalProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ServicesProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => DescriptionProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => PaymentScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => OtpVerifyProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ShirtProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => TshirtProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ShoesProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => WatchProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => JeansProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ShirtProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => TshirtProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => JeansProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => ShoesProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => WatchProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (crete) => UserProviderTwo(),
        ),
        ChangeNotifierProvider(
          create: (crete) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: RoutesProvider.navigatorKey,
        scaffoldMessengerKey: AppColor.rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.kWhite,
          fontFamily: GoogleFonts.mulish().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
