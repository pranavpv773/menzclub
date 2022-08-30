import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    RoutesProvider.removeScreen(
      screen: const GlobalScreen(),
    );
  }
}
