import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OrderApi {
  Future<OrderResponseModel> orderProduct(
      BuildContext context, Order data) async {
    try {
      Response response = await Dio().post(ApiEndPoints.removeCart, data: data);
      if (response.statusCode == 200) {
        log(response.data.toString());
        return OrderResponseModel.fromJson(response.data);
      } else {
        return OrderResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return OrderResponseModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return OrderResponseModel(
        status: false,
        message: e.toString(),
      );
    }
  }
}
