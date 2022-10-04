// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/get_started/view/main_screen.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashProvider with ChangeNotifier {
  Future<void> goHome(BuildContext context) async {
    final checkLogged = await SharedPreferences.getInstance();
    final checkResult = checkLogged.getBool('get_started') ?? false;

    await context.read<ShirtProvider>().fetchShirtFuction();
    await context.read<TshirtProvider>().fetchTShirtFuction();
    await context.read<JeansProvider>().fetchJeans();
    await context.read<WatchProvider>().fetchWatchesfromApi();
    await context.read<ShoesProvider>().fetchShoes();

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
