import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class WatchApiService {
  Future<WatchModel> fetchWatch() async {
    log('reached shirt');
    try {
      Response response = await Dio().get(ApiEndPoints.getWatches);
      if (response.statusCode == 200) {
        return WatchModel.fromJson(response.data);
      } else {
        return WatchModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return WatchModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return WatchModel(status: false, message: e.toString(), watch: []);
    }
  }
}
