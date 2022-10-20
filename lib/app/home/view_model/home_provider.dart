// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/home/api_services/banner_api.dart';
import 'package:menz_cart_app/app/home/model/banner_model.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  bool checkingFn = false;
  HomeProvider() {
    getToHome();
    checkingFn;
  }
  int currentIndex = 0;
  List<Banners> listBanner = [];

  Future<void> fetchBanner(String apiString) async {
    BannerModel resp = await BannerApiService().fetchBanner(apiString);

    if (resp.status && resp.banner.isNotEmpty) {
      listBanner.clear();
      listBanner.addAll(resp.banner);
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

  getToHome() async {
    await AppColor.rootScaffoldMessengerKey.currentState!.context
        .read<ShirtProvider>()
        .fetchShirtFuction();
    await fetchBanner("banners");
    await AppColor.rootScaffoldMessengerKey.currentState!.context
        .read<TshirtProvider>()
        .fetchTShirtFuction();
    await AppColor.rootScaffoldMessengerKey.currentState!.context
        .read<JeansProvider>()
        .fetchJeans();
    await AppColor.rootScaffoldMessengerKey.currentState!.context
        .read<WatchProvider>()
        .fetchWatchesfromApi();
    await AppColor.rootScaffoldMessengerKey.currentState!.context
        .read<ShoesProvider>()
        .fetchShoes();
    log("hai");
    notifyListeners();
  }
}
