import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class WatchApiService {
  Future<WatchModel> fetchWatch(BuildContext context) async {
    log('reached shirt');
    try {
      Response response = await Dio().get(ApiEndPoints.getWatches);
      if (response.statusCode == 200) {
        // final jsonData = response.data as List;
        // final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        return WatchModel.fromJson(response.data);
      } else {
        return WatchModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return WatchModel.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return WatchModel(status: false, message: e.toString(), watch: []);
    }
  }
}
