import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';

class JeansMaterialApiServices {
  Future<JeansModel> fetchShirtMaterial(String material) async {
    try {
      Response response = await Dio().get(
          "http://10.0.2.2:3000/api/menzclub/jeans/material?jeans_material=$material");
      if (response.statusCode == 200) {
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
