// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class JeansCategoryApiServices {
  Future<JeansModel> fetchJeansCategory(String category) async {
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/jeans?jeans_category=$category");
      if (response.statusCode == 200) {
        return JeansModel.fromJson(response.data);
      } else {
        return JeansModel.fromJson(response.data);
      }
    } on DioError catch (e) {
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
