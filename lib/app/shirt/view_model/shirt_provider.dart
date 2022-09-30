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
    shirtMapList.clear();

    List<ShirtModel> resp = await ShirtApiServices.fetchProducts(context);
    if (resp.isNotEmpty) {
      shirtMapList.addAll(resp);
      notifyListeners();
    } else {}
  }
}
