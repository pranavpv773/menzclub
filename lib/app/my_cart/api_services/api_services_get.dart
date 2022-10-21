// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
// import 'package:menz_cart_app/services/api_endpoints.dart';

// class CartGetApiService {
//   Future<CartRespoModel> fetchProducts() async {
//     log('reached jeans');
//     try {
//       Response response = await Dio().get(ApiEndPoints.getJeans);
//       if (response.statusCode == 200) {
//         log("jeans success");
//         return CartRespoModel.fromJson(response.data);
//       } else {
//         return CartRespoModel.fromJson(response.data);
//       }
//     } on DioError catch (e) {
//       log('message');
//       return CartRespoModel.fromJson(e.response!.data);
//     } catch (e) {
//       log(e.toString());
//       return CartRespoModel(status: false, message: e.toString(), cart: []);
//     }
//   }
// }
