// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class WatchCategoryApiServices {
  Future<WatchModels> fetchWatchCategory(String category) async {
    try {
      Response response = await Dio().get(
          "${ApiEndPoints.baseUrl}/api/menzclub/watch?twatch_category=$category");
      if (response.statusCode == 200) {
        return WatchModels.fromJson(response.data);
      } else {
        return WatchModels.fromJson(response.data);
      }
    } on DioError catch (e) {
      return WatchModels.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return WatchModels(
        watch: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
