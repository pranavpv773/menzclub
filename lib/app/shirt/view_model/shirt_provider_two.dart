import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/shirt/api_services/collection_api.dart';
import 'package:menz_cart_app/app/shirt/api_services/color_api.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class ShirtProviderTwo with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  List<Shirt> shirtcolor = [];
  List<Shirt> shirtCollection = [];
  List<Shirt> shirtCategory = [];
  bool fetchBool = false;

  fetchShirtColor(String color) async {
    fetchBool = true;
    notifyListeners();
    shirtcolor.clear();
    ShirtModel resp =
        await ShirtColorApiServices().fetchShirtColor(color.toLowerCase());

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtcolor.clear();
      fetchBool = false;
      shirtcolor.addAll(resp.shirt);

      notifyListeners();
    } else {
      fetchBool = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCollection(String collection) async {
    shirtCollection.clear();
    ShirtModel resp = await ShirtCollectionApiServices()
        .fetchShirtCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtCollection.clear();
      shirtCollection.addAll(resp.shirt);
      log(shirtCollection.length.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCategory(String category) async {
    shirtCategory.clear();
    ShirtModel resp = await ShirtCategoryApiServices()
        .fetchShirtCategory(category.toLowerCase());
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtCategory.clear();
      log(resp.message);
      shirtCategory.addAll(resp.shirt);

      notifyListeners();
    } else {
      log('hfdkkk');
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
