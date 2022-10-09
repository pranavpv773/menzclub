import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShirtColorApiServices {
  Future<ShirtModel> fetchShirtColor(String color) async {
    log(color);
    try {
      Response response = await Dio()
          .get("${ApiEndPoints.baseUrl}/api/menzclub/color?shirt_color=$color");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return ShirtModel.fromJson(response.data);
      } else {
        return ShirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ShirtModel(
        shirt: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
