import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:menz_cart_app/services/view_model/http_services.dart';
import 'package:provider/provider.dart';

class ProductsProvider with ChangeNotifier {
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
      var products = await context.read<HttpServicere>().fetchProducts();
      if (products.isNotEmpty) {
        productList.addAll(products);
      } else {
        print('empty');
      }
    } finally {
      // isLoading = false;
    }
  }
}
