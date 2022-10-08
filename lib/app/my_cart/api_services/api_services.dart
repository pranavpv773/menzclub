// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class CartApiServices {
  Future<UserMainModel> addToCart() async {
    log('reached cart');
    try {
      Response response = await Dio().get(ApiEndPoints.getShirts);
      if (response.statusCode == 200) {
        return UserMainModel.fromJson(response.data);
      } else {
        return UserMainModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return UserMainModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return UserMainModel(
        userModel: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
