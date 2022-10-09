// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class TshirtCategoryApiServices {
  Future<TshirtModel> fetchShirtCategory(String category) async {
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/t-shirt?tShirt_category=$category");
      if (response.statusCode == 200) {
        return TshirtModel.fromJson(response.data);
      } else {
        return TshirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return TshirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return TshirtModel(
        tShirt: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
