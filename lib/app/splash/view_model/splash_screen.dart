import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/get_started/view/main_screen.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    final checkLogged = await SharedPreferences.getInstance();
    final checkResult = checkLogged.getBool('get_started') ?? false;
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (checkResult) {
      RoutesProvider.removeScreenUntil(
        screen: const GlobalScreen(),
      );
    } else {
      RoutesProvider.removeScreenUntil(
        screen: const LiquidSwiperScreen(),
      );
    }
  }
}
