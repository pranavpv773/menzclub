import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/services/model/product_model.dart';

class HttpServicere with ChangeNotifier {
  List<ProductsModel> finalList = [];
  fetchProducts() async {
    Response response = await Dio().get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      final jsonData = response.data as List;

      final newList = jsonData.map((e) => ProductsModel.fromJson(e)).toList();
      finalList.addAll(newList);
      notifyListeners();
    } else {
      throw Exception();
    }
  }
}
