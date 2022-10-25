import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/api_services/categories_api_services.dart';
import 'package:menz_cart_app/app/shirt/api_services/collection_api.dart';
import 'package:menz_cart_app/app/shirt/api_services/color_api.dart';
import 'package:menz_cart_app/app/shirt/api_services/material_api.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class ShirtProviderTwo with ChangeNotifier {
  List<Shirt> shirtMapList = [];
  List<Shirt> shirtcolor = [];
  List<Shirt> shirtCollection = [];
  List<Shirt> shirtCategory = [];
  bool fetchBool = false;
  List<Shirt> shirtMaterial = [];

  fetchShirtColor(String color) async {
    fetchBool = true;
    notifyListeners();
    shirtcolor.clear();
    ShirtModel resp =
        await ShirtColorApiServices().fetchShirtColor(color.toLowerCase());

    if (resp.status && resp.shirt.isNotEmpty) {
      shirtcolor.clear();
      fetchBool = false;
      shirtcolor.addAll(resp.shirt);

      notifyListeners();
    } else {
      fetchBool = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: "List is empty",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCollection(String collection) async {
    fetchBool = true;
    shirtCollection.clear();
    ShirtModel resp = await ShirtCollectionApiServices()
        .fetchShirtCollection(collection.toLowerCase());
    log('message');
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtCollection.clear();
      shirtCollection.addAll(resp.shirt);
      log(shirtCollection.length.toString());
      fetchBool = false;
      notifyListeners();
    } else {
      fetchBool = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtCategory(String category) async {
    fetchBool = true;
    shirtCategory.clear();
    ShirtModel resp = await ShirtCategoryApiServices()
        .fetchShirtCategory(category.toLowerCase());
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtCategory.clear();
      log(resp.message);
      shirtCategory.addAll(resp.shirt);
      fetchBool = false;
      notifyListeners();
    } else {
      fetchBool = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  fetchShirtMaterial(String material) async {
    fetchBool = true;
    notifyListeners();
    ShirtModel resp = await ShirtMaterialApiServices()
        .fetchShirtMaterial(material.toLowerCase());
    log(material);
    if (resp.status && resp.shirt.isNotEmpty) {
      shirtMaterial.clear();
      log(resp.toString());
      shirtMaterial.addAll(resp.shirt);
      fetchBool = false;
      notifyListeners();
    } else {
      fetchBool = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
