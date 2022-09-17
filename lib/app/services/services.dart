// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class HttpServicere with ChangeNotifier {
//   List<ProductsModel> finalList = [];
//   fetchProducts() async {
//     Response response = await Dio().post('https://fakestoreapi.com/products');
//     if (response.statusCode == 200) {
//       final jsonData = response.data as List;

//       final newList = jsonData.map((e) => ProductsModel.fromJson(e)).toList();
//       finalList.addAll(newList);
//       notifyListeners();
//     } else {
//       throw Exception();
//     }
//   }
// }
