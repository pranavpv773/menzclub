import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class CartGetApiService {
  Future<CartModel> fetchCart(String mail) async {
    try {
      Response response = await Dio().get("${ApiEndPoints.fetchCart}$mail");
      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      } else {
        return CartModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return CartModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return CartModel(status: false, message: e.toString(), cart: []);
    }
  }
}
