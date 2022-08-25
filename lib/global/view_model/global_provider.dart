import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/global/view/global_screen.dart';
import 'package:menz_cart_app/shirt/view/shirt_screen.dart';

class GlobalProvider with ChangeNotifier {
  int pageIndex = 0;

  final pages = [
    const ShirtScreen(),
    const ShirtScreen(),
    const ShirtScreen(),
    const ShirtScreen(),
    const ShirtScreen(),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;
    notifyListeners();
  }
}
