// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/get_started/view/main_screen.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/splash/view/no_internet.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  bool checkingButton = false;
  Future<void> goHome(BuildContext context) async {
    final check = await checking();
    log(check.toString());
    final checkGetStart = await SharedPreferences.getInstance();
    final checkResult = checkGetStart.getBool('get_started') ?? false;
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (checkResult) {
      RoutesProvider.removeScreenUntil(
        screen: check == true ? const GlobalScreen() : const NointernetScreen(),
      );
    } else {
      RoutesProvider.removeScreenUntil(
        screen: const LiquidSwiperScreen(),
      );
    }
  }

  Future<bool> checking() async {
    checkingButton = true;
    notifyListeners();
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        checkingButton = false;
        notifyListeners();
        return true;
      }
      checkingButton = false;
      notifyListeners();

      return false;
    } on SocketException catch (_) {
      log('not connected');
      checkingButton = false;
      notifyListeners();

      return false;
    }
  }
}
