// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/shoes/api_services/api_services.dart';
import 'package:menz_cart_app/app/shoes/api_services/fit_categories.dart';
import 'package:menz_cart_app/app/shoes/api_services/material_api.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';

class ShoesProvider with ChangeNotifier {
  List<Shoes> shoesList = [];
  List<Shoes> shoesFitList = [];
  List<Shoes> shoesSizeList = [];
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

  fetchShirtFit(String fit) async {
    shoesFitList.clear();
    log('first');
    ShoesModel resp =
        await ShoesFitApiServices().fetchShirtfit(fit.toLowerCase());

    if (resp.status && resp.shoes.isNotEmpty) {
      shoesFitList.clear();
      log(resp.toString());
      shoesFitList.addAll(resp.shoes);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtSize(int size) async {
    shoesSizeList.clear();
    log('first');
    ShoesModel resp = await ShoesSizeApiServices().fetchShoesSize(size.toInt());
    if (resp.status && resp.shoes.isNotEmpty) {
      shoesSizeList.clear();
      log(resp.toString());
      shoesSizeList.addAll(resp.shoes);

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
