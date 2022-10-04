// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShirtApiServices {
  static fetchProducts(BuildContext context) async {
    log('reached shirt');
    try {
      Response response = await Dio().get(ApiEndPoints.getShirts);
      if (response.statusCode == 200) {
        final jsonData = response.data as List;
        final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        return newList;
      } else {
        return EmailSigninResp.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return EmailSigninResp.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return EmailSigninResp(
        status: false,
        message: e.toString(),
      );
    }
  }
}
