import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class ShirtProvider with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  fetchShirtFuction() async {
    ShirtModel resp = await ShirtApiServices().fetchProducts();

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMapList.clear();
      log(resp.toString());
      shirtMapList.addAll(resp.shirt);
      log('message');
      log(shirtMapList.toString());

      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
