import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/home/view/home_screen.dart';
import 'package:menz_cart_app/shirt/view/shirt_screen.dart';

class HomeProvider with ChangeNotifier {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const ShirtScreen(),
    const HomeScreen(),
    const ShirtScreen(),
  ];
}
