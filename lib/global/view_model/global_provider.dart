import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/account/view/account_screen.dart';
import 'package:menz_cart_app/categories/view/category_screen.dart';
import 'package:menz_cart_app/home/view/home_screen.dart';
import 'package:menz_cart_app/shirt/view/shirt_screen.dart';

class GlobalProvider with ChangeNotifier {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const ShirtScreen(
      string: 'Notification',
    ),
    const AccountScreen(),
    const ShirtScreen(
      string: 'cart',
    ),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;
    notifyListeners();
  }
}
