import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shoes/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/shoes/api_services/collection_api.dart';
import 'package:menz_cart_app/app/shoes/api_services/color_api.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';

class ShoesProviderTwo with ChangeNotifier {
  List<Shoes> shoesMapList = [];
  List<Shoes> shoescolor = [];
  List<Shoes> shoesCollection = [];
  List<Shoes> shoesCategory = [];

  fetchShoesColor(String color) async {
    shoescolor.clear();
    ShoesModel resp =
        await ShoesColorApiServices().fetchShoesColor(color.toLowerCase());

    if (resp.status && resp.shoes.isNotEmpty) {
      shoescolor.clear();
      shoescolor.addAll(resp.shoes);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShoesCollection(String collection) async {
    shoesCollection.clear();
    ShoesModel resp = await ShoesCollectionApiServices()
        .fetchShoesCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.shoes.isNotEmpty) {
      shoesCollection.clear();
      shoesCollection.addAll(resp.shoes);
      log(shoesCollection.length.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShoesCategory(String category) async {
    shoesCategory.clear();
    ShoesModel resp = await ShoesCategoryApiServices()
        .fetchShoesCategory(category.toLowerCase());
    if (resp.status && resp.shoes.isNotEmpty) {
      shoesCategory.clear();
      log(resp.message);
      shoesCategory.addAll(resp.shoes);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
