// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/watches/api_services/api_services.dart';
import 'package:menz_cart_app/app/watches/api_services/offer_api_services.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';

class WatchProvider with ChangeNotifier {
  List<Watch> watchList = [];
  List<Watch> watchPriceList = [];
  Future<void> fetchWatchesfromApi() async {
    WatchModels resp = await WatchApiService().fetchWatch();

    if (resp.status && resp.watch.isNotEmpty) {
      watchList.clear();
      log(resp.toString());
      watchList.addAll(resp.watch);
      allProducts.addAll(watchList);
      log(allProducts.length.toString());
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchWatchPrice(int price) async {
    watchPriceList.clear();
    log('first');
    WatchModels resp =
        await WatchPriceApiServices().fetchWatchPrice(price.toInt());
    if (resp.status && resp.watch.isNotEmpty) {
      watchPriceList.clear();
      log(resp.toString());
      watchPriceList.addAll(resp.watch);

      notifyListeners();
    } else {
      log('error');
      Fluttertoast.showToast(
        msg: 'Sorry List is empty',
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
