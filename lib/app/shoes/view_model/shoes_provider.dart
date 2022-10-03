// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shoes/api_services/api_services.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:provider/provider.dart';

class ShoesProvider with ChangeNotifier {
  Future<void> fetchShoes(BuildContext context) async {
    ShoesModel resp = await ShoesApiService().fetchProducts(context);

    if (resp.status && resp.shoes.isNotEmpty) {
      context.read<ShirtProvider>().shirtMapList.clear();
      //  final jsonData = resp.shoes;

      // final newList = jsonData.jeans((e) => Jeans.fromJson(e));
      log(resp.toString());
      context.read<ShirtProvider>().shirtMapList.addAll(resp.shoes);
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
