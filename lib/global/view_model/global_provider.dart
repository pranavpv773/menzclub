import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/global/view/global_screen.dart';
import 'package:menz_cart_app/shirt/view/shirt_screen.dart';

class GlobalProvider with ChangeNotifier {
  int pageIndex = 0;

  final pages = [
    const ShirtScreen(
      string: 'home',
    ),
    const ShirtScreen(
      string: 'categories',
    ),
    const ShirtScreen(
      string: 'notification',
    ),
    const ShirtScreen(
      string: 'account',
    ),
    const ShirtScreen(
      string: 'cart',
    ),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;
    notifyListeners();
  }
}
