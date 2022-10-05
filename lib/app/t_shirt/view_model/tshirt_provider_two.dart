import 'dart:developer';

import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/collection_api.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/color_api.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';

class TshirtProviderTwo with ChangeNotifier {
  List<TShirt> tShirtMapList = [];
  List<TShirt> tShirtcolor = [];
  List<TShirt> tShirtCollection = [];
  List<TShirt> tShirtCategory = [];

  fetchShirtColor(String color) async {
    tShirtcolor.clear();
    TshirtModel resp =
        await TshirtColorApiServices().fetchShirtColor(color.toLowerCase());

    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtcolor.clear();
      tShirtcolor.addAll(resp.tShirt);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCollection(String collection) async {
    tShirtCollection.clear();
    TshirtModel resp = await TshirtCollectionApiServices()
        .fetchTshirtCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtCollection.clear();
      tShirtCollection.addAll(resp.tShirt);
      log(tShirtCollection.length.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCategory(String category) async {
    tShirtCategory.clear();
    TshirtModel resp = await TshirtCategoryApiServices()
        .fetchShirtCategory(category.toLowerCase());
    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtCategory.clear();
      log(resp.message);
      tShirtCategory.addAll(resp.tShirt);

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
