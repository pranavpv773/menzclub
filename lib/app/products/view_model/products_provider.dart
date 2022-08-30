import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/routes/routes.dart';

class ProductsProvider with ChangeNotifier {
  bool radioValue = false;
  int val = -1;

  chekRadio(value) {
    val = value;
    RoutesProvider.backScreen();
    notifyListeners();
  }
}
