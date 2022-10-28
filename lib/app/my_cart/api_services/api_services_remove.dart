import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class CartRemoveApi {
  Future<CartRespoModel> removeFromCart(BuildContext context, String id) async {
    try {
      Response response = await Dio().post("${ApiEndPoints.removeCart}$id");
      if (response.statusCode == 200) {
        log(response.data.toString());
        return CartRespoModel.fromJson(response.data);
      } else {
        return CartRespoModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return CartRespoModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return CartRespoModel(
        status: false,
        message: e.toString(),
      );
    }
  }
}
