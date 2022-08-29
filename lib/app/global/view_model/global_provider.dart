import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/account/view/account_screen.dart';
import 'package:menz_cart_app/app/categories/view/category_screen.dart';
import 'package:menz_cart_app/app/home/view/home_screen.dart';
import 'package:menz_cart_app/app/my_cart/view/cart_screen.dart';

class GlobalProvider with ChangeNotifier {
  int pageIndex = 0;
  bool showAppbar = true;
  final pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;
    notifyListeners();
  }

  onTabAppbarCheck(bool check) {
    showAppbar = check;
    notifyListeners();
  }
}
