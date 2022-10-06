import 'dart:developer';

import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/jeans/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/jeans/api_services/collection_api.dart';
import 'package:menz_cart_app/app/jeans/api_services/color_api.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';

class JeansProviderTwo with ChangeNotifier {
  List<Jeans> jeansMapList = [];
  List<Jeans> jeanscolor = [];
  List<Jeans> jeansCollection = [];
  List<Jeans> jeansCategory = [];

  fetchjeansColor(String color) async {
    jeanscolor.clear();
    JeansModel resp =
        await JeansColorApiServices().fetchJeansColor(color.toLowerCase());

    if (resp.status && resp.jeans.isNotEmpty) {
      jeanscolor.clear();
      jeanscolor.addAll(resp.jeans);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchJeansCollection(String collection) async {
    jeansCollection.clear();
    JeansModel resp = await JeansCollectionApiServices()
        .fetchJeansCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.jeans.isNotEmpty) {
      jeansCollection.clear();
      jeansCollection.addAll(resp.jeans);
      log(jeansCollection.length.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchJeansCategory(String category) async {
    jeansCategory.clear();
    JeansModel resp = await JeansCategoryApiServices()
        .fetchJeansCategory(category.toLowerCase());
    if (resp.status && resp.jeans.isNotEmpty) {
      jeansCategory.clear();
      log(resp.message);
      jeansCategory.addAll(resp.jeans);

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
