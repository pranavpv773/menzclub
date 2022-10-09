// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShoesCategoryApiServices {
  Future<ShoesModel> fetchShoesCategory(String category) async {
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/shoes?shoes_category=$category");
      if (response.statusCode == 200) {
        return ShoesModel.fromJson(response.data);
      } else {
        return ShoesModel.fromJson(response.data);
      }
    } on DioError catch (e) {
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
