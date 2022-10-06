import 'dart:developer';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/watches/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/watches/api_services/collection_api.dart';
import 'package:menz_cart_app/app/watches/api_services/color_api.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';

class WatchProviderTwo with ChangeNotifier {
  List<Watch> watchMapList = [];
  List<Watch> watchcolor = [];
  List<Watch> watchCollection = [];
  List<Watch> watchCategory = [];

  fetchWatchColor(String color) async {
    watchcolor.clear();
    WatchModels resp =
        await WatchColorApiServices().fetchWatchColor(color.toLowerCase());

    if (resp.status && resp.watch.isNotEmpty) {
      watchcolor.clear();
      watchcolor.addAll(resp.watch);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchWatchCollection(String collection) async {
    watchCollection.clear();
    WatchModels resp = await WatchCollectionApiServices()
        .fetchWatchCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.watch.isNotEmpty) {
      watchCollection.clear();
      watchCollection.addAll(resp.watch);
      log(watchCollection.length.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCategory(String category) async {
    watchCategory.clear();
    WatchModels resp = await WatchCategoryApiServices()
        .fetchWatchCategory(category.toLowerCase());
    if (resp.status && resp.watch.isNotEmpty) {
      watchCategory.clear();
      log(resp.message);
      watchCategory.addAll(resp.watch);

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
