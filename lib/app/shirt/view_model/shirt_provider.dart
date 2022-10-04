import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/shirt/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class ShirtProvider with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  List<Shirt> shirtFit = [];
  List<Shirt> shirtMaterial = [];
  fetchShirtFuction() async {
    ShirtModel resp = await ShirtApiServices().fetchProducts();

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMapList.clear();
      log(resp.toString());
      shirtMapList.addAll(resp.shirt);
      log(shirtMapList.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtFit(String fit) async {
    shirtFit.clear();
    log('first');
    ShirtModel resp = await ShirtCategoryApiServices().fetchShirtfit(fit);

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtFit.clear();
      log(resp.toString());
      shirtFit.addAll(resp.shirt);

      notifyListeners();
    } else {
      log('error');
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtMaterial(String material) async {
    shirtFit.clear();
    log('first');
    ShirtModel resp = await ShirtCategoryApiServices()
        .fetchShirtMaterial(material.toLowerCase());
    log(material);
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMaterial.clear();
      log(resp.toString());
      shirtMaterial.addAll(resp.shirt);

      notifyListeners();
    } else {
      log('error');
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
