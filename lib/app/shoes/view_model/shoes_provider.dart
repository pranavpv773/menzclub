// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shoes/api_services/api_services.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';

class ShoesProvider with ChangeNotifier {
  List<Shoes> shoesList = [];
  Future<void> fetchShoes() async {
    ShoesModel resp = await ShoesApiService().fetchProducts();

    if (resp.status && resp.shoes.isNotEmpty) {
      shoesList.clear();
      log(resp.toString());
      shoesList.addAll(resp.shoes);

      log(shoesList.toString());

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
