import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/order_summary/model/response_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OrderApi {
  Future<ResponseModel> orderProduct(BuildContext context, data) async {
    log('reached cart');
    try {
      log('reached try');

      Response response =
          await Dio().post(ApiEndPoints.orderProduct, data: data.toJson());
      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        return ResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ResponseModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        status: false,
        message: e.toString(),
      );
    }
  }
}
