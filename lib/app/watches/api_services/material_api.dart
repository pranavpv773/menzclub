import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';

class WatchMaterialApiServices {
  Future<WatchModels> fetchWatchMaterial(String material) async {
    try {
      Response response = await Dio().get(
          "http://10.0.2.2:3000/api/menzclub/watch/material?watch_material=$material");
      if (response.statusCode == 200) {
        return WatchModels.fromJson(response.data);
      } else {
        return WatchModels.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
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
