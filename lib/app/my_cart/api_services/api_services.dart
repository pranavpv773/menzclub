// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class CartApiServices {
  Future<CartModel> addToCart(BuildContext context, Cart data) async {
    log('reached cart');
    try {
      log('reached try');

      Response response =
          await Dio().post(ApiEndPoints.addToCartApi, data: data.toJson());
      if (response.statusCode == 200) {
        log('reached success');

        return CartModel.fromJson(response.data);
      } else {
        return CartModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return CartModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return CartModel(
        cart: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
