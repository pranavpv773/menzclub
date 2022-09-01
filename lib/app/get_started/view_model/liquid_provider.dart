import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/description/view_model/description_provider.dart';
import 'package:menz_cart_app/app/get_started/view/first_screen.dart';
import 'package:menz_cart_app/app/get_started/view/second_screen.dart';
import 'package:menz_cart_app/app/get_started/view/third_screen.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/home/view/home_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';

class LiquidProvider with ChangeNotifier {
  final page = [
    const FirstScreen(),
    const SecondSdcreen(),
    const ThirdScreen(),
  ];
  iconFunction(index) {
    if (page[2] == index) {
      const Icon(Icons.arrow_back_ios);
      notifyListeners();
    } else {
      SizedBox();
      notifyListeners();
    }
  }

  screeFunction(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertboxWidget(
            title: 'Do you want to continue with out Login',
            btn: 'Home',
            function: () =>
                RoutesProvider.removeScreenUntil(screen: GlobalScreen()),
          );
        });
  }
}
