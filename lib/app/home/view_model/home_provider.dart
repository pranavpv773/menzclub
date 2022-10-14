// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/home/api_services/banner_api.dart';
import 'package:menz_cart_app/app/home/model/banner_model.dart';

class HomeProvider with ChangeNotifier {
  int currentIndex = 0;
  List<Banners> listBanner = [];

  Future<void> fetchBanner(String apiString) async {
    BannerModel resp = await BannerApiService().fetchBanner(apiString);

    if (resp.status && resp.banner.isNotEmpty) {
      listBanner.clear();
      log(resp.toString());
      listBanner.addAll(resp.banner);
      log(listBanner[0].images[1].toString());
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  indexCheck(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
