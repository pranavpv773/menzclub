import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/services/model/product_model.dart';

class HttpServicere with ChangeNotifier {
  List<ProductsModel> finalList = [];
  // List<ProductsModel> productsModelFromJson(String str) =>
  //     List<ProductsModel>.from(
  //         json.decode(str)((x) => ProductsModel.fromJson(x)));

  // String productsModelToJson(List<ProductsModel> data) =>
  //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  fetchProducts() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      final jsonData = response.data as List;

      final newList = jsonData.map((e) => ProductsModel.fromJson(e)).toList();
      print(newList);
      finalList.addAll(newList);
      notifyListeners();
    } else {
      throw Exception();
    }
  }
}
