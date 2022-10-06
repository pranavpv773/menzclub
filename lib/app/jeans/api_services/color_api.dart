import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';

class JeansColorApiServices {
  Future<JeansModel> fetchJeansColor(String color) async {
    log(color);
    try {
      Response response = await Dio().get(
          "http://10.0.2.2:3000/api/menzclub/jeans/color?jeans_color=$color");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return JeansModel.fromJson(response.data);
      } else {
        return JeansModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return JeansModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return JeansModel(
        jeans: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
