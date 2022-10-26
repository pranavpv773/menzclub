// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/shirt/api_services/fit_categories.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../products/view_model/products_provider.dart';

class ShirtProvider with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  List<Shirt> shirtFit = [];

  fetchShirtFuction() async {
    ShirtModel resp = await ShirtApiServices().fetchProducts();

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMapList.clear();
      log(resp.toString());
      shirtMapList.addAll(resp.shirt);
      notifyListeners();
      log(shirtMapList.length.toString());
      AppColor.rootScaffoldMessengerKey.currentState!.context
          .read<ProductsProvider>()
          .allProducts
          .addAll(resp.shirt);
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
    ShirtModel resp =
        await ShirtFitApiServices().fetchShirtfit(fit.toLowerCase());

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtFit.clear();
      log(resp.toString());
      shirtFit.addAll(resp.shirt);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: "Sorry list is empty",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
