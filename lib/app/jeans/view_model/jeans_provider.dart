// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view/global_screen.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/jeans/api_services/api_services.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class JeansProvider with ChangeNotifier {
  Future<void> fetchJeans(BuildContext context) async {
    JeansModel resp = await JeansApiService().fetchProducts(context);

    if (resp.status && resp.jeans.isNotEmpty) {
      context.read<ShirtProvider>().shirtMapList.clear();
      final jsonData = resp.jeans;

      // final newList = jsonData.jeans((e) => Jeans.fromJson(e));
      log(resp.toString());
      context.read<ShirtProvider>().shirtMapList.addAll(resp.jeans);
      log('message');
      log(context.read<ShirtProvider>().shirtMapList.toString());

      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
