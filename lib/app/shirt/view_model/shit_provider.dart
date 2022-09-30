import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';

class ShirtProvider with ChangeNotifier {
  List shirtMapList = [];
  fetchShirtFuction(
    BuildContext context,
  ) async {
    log('Reached');

    log('get in to password');

    List<ShirtModel> resp = await ShirtApiServices.fetchProducts(context);
    log('get in to second');
    if (resp.isNotEmpty) {
      shirtMapList.addAll(resp);
      notifyListeners();
      // disposeControll();
    } else {}
  }
}
