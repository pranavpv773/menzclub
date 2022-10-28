import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/description/view/widgets/alert_box.dart';
import 'package:menz_cart_app/app/get_started/view/first_screen.dart';
import 'package:menz_cart_app/app/get_started/view/second_screen.dart';
import 'package:menz_cart_app/app/get_started/view/third_screen.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LiquidProvider with ChangeNotifier {
  final page = [
    const FirstScreen(),
    const SecondSdcreen(),
    const ThirdScreen(),
  ];

  screeFunction(BuildContext context) async {
    final shared = await SharedPreferences.getInstance();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertboxWidget(
          title: 'Do you want to continue with out Login',
          btn: 'Home',
          function: () {
            shared.setBool('get_started', true);
            RoutesProvider.removeScreenUntil(
              screen: const GlobalScreen(),
            );
          },
        );
      },
    );
  }
}
