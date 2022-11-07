import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/account/view/account_screen.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/categories/view/category_screen.dart';
import 'package:menz_cart_app/app/categories/view/shimmer_widget.dart';
import 'package:menz_cart_app/app/home/view/home_screen.dart';
import 'package:menz_cart_app/app/home/view/shimmer_widget.dart';
import 'package:menz_cart_app/app/my_cart/view/cart_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class GlobalProvider with ChangeNotifier {
  int pageIndex = 0;
  bool showAppbar = true;
  final pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  final shimmer = [
    const ShimmerHome(),
    const ShimmerCategories(),
    const ShimmerCategories(),
    const ShimmerCategories()
  ];
  DateTime? currentBackPressTime;

  onTabIndexChange(int number) {
    pageIndex = number;
    if (pageIndex == 3) {
      showAppbar = false;
      notifyListeners();
    } else {
      showAppbar = true;
      notifyListeners();
    }
    notifyListeners();
  }

  onTabIndexColor(index) {
    if (pageIndex == index) {
      AppColor.primary2;
      notifyListeners();
    } else {
      AppColor.primary;
      notifyListeners();
    }
    notifyListeners();
  }

  onTabAppbarCheck() {
    notifyListeners();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          backgroundColor: AppColor.primary,
          textColor: AppColor.kWhite,
          msg: "Double Tab to Exit",
          toastLength: Toast.LENGTH_LONG);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
