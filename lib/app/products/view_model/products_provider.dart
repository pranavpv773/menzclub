import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/routes/routes.dart';

class ProductsProvider with ChangeNotifier {
  List allProducts = [];

  bool radioValue = false;
  int val = -1;
  // bool isLoading = true;
  var productList = [];

  chekRadio(value) {
    val = value;
    RoutesProvider.backScreen();
    notifyListeners();
  }

  void fetchData(BuildContext context) async {
    try {
      // isLoading = false;

    } finally {
      // isLoading = false;
    }
  }
}
