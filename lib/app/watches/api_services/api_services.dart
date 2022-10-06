import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class WatchApiService {
  Future<WatchModels> fetchWatch() async {
    log('reached shirt');
    try {
      Response response = await Dio().get(ApiEndPoints.getWatches);
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
      return WatchModels(status: false, message: e.toString(), watch: []);
    }
  }
}
