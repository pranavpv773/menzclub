// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/watches/api_services/api_services.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';

class WatchProvider with ChangeNotifier {
  List<Watch> watchList = [];
  Future<void> fetchWatchesfromApi() async {
    WatchModel resp = await WatchApiService().fetchWatch();

    if (resp.status && resp.watch.isNotEmpty) {
      watchList.clear();
      log(resp.toString());
      watchList.addAll(resp.watch);
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
