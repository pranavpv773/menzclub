import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/shirt/api_services/fit_categories.dart';
import 'package:menz_cart_app/app/shirt/api_services/material_api.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

List allProducts = [];

class ShirtProvider with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  List<Shirt> shirtFit = [];
  List<Shirt> shirtMaterial = [];

  // List<Shirt> shirtCategoryList = [];
  fetchShirtFuction() async {
    ShirtModel resp = await ShirtApiServices().fetchProducts();

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMapList.clear();
      log(resp.toString());
      shirtMapList.addAll(resp.shirt);
      allProducts.addAll(shirtMapList);
      log(allProducts.length.toString());
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
    ShirtModel resp =
        await ShirtFitApiServices().fetchShirtfit(fit.toLowerCase());

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtFit.clear();
      log(resp.toString());
      shirtFit.addAll(resp.shirt);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtMaterial(String material) async {
    shirtFit.clear();
    log('first');
    ShirtModel resp = await ShirtMaterialApiServices()
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

  // fetchCategoryList() {
  //   for (int i = 0; i <= shirtMapList.length; i++) {
  //     shirtCategoryList.clear();
  //     for (int j = 1 + 1; j < shirtMapList.length - 1; j++) {
  //       if (shirtMapList[i].category != shirtMapList[j].category) {
  //         shirtCategoryList.add(shirtMapList[i]);
  //       }
  //     }
  //     log(shirtCategoryList[i].category);
  //   }
  // }
}
