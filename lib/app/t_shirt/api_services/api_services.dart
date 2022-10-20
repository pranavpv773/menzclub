// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class TShirtApiServices {
  Future<TshirtModel> fetchApiTshirts() async {
    try {
      Response response = await Dio().get(ApiEndPoints.getTshits);
      if (response.statusCode == 200) {
        return TshirtModel.fromJson(response.data);
      } else {
        return TshirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return TshirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return TshirtModel(status: false, message: e.toString(), tShirt: []);
    }
  }
}
