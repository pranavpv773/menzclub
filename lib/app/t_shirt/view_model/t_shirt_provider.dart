// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/fit_categories.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TshirtProvider with ChangeNotifier {
  List<TShirt> tShirtList = [];
  List<TShirt> tShirtFitList = [];
  Future<void> fetchTShirtFuction() async {
    TshirtModel resp = await TShirtApiServices().fetchApiTshirts();

    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtList.clear();
      tShirtList.addAll(resp.tShirt);
      AppColor.rootScaffoldMessengerKey.currentState!.context
          .read<ProductsProvider>()
          .allProducts
          .addAll(tShirtList);
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchTshirtFit(String fit) async {
    tShirtFitList.clear();
    log('first');
    TshirtModel resp =
        await TshirtFitApiServices().fetchShirtfit(fit.toLowerCase());

    if (resp.status && resp.tShirt.isNotEmpty) {
      tShirtFitList.clear();
      log(resp.toString());
      tShirtFitList.addAll(resp.tShirt);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
