// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:menz_cart_app/app/order_summary/model/response_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OrderApi {
  Future<ResponseModel> orderProduct(BuildContext context, Order data) async {
    log('reached cart');
    try {
      log('reached try');

      Response response =
          await Dio().post(ApiEndPoints.orderProduct, data: data.toJson());
      if (response.statusCode == 200) {
        log(response.data.toString());
        log('reached success');

        return ResponseModel.fromJson(response.data);
      } else {
        return ResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('dio error');
      return ResponseModel(message: e.message, status: false);
    } catch (e) {
      log(e.toString());
      return ResponseModel(
        status: false,
        message: e.toString(),
      );
    }
  }
}
