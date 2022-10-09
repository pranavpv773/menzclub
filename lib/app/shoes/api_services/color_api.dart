import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShoesColorApiServices {
  Future<ShoesModel> fetchShoesColor(String color) async {
    log(color);
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/shoes/color?shoes_color=$color");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return ShoesModel.fromJson(response.data);
      } else {
        return ShoesModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShoesModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ShoesModel(
        shoes: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
