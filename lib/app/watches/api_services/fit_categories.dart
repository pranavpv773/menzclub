import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
import 'package:menz_cart_app/app/watches/model/watch_model.dart';

class WatchFitApiServices {
  Future<WatchModels> fetchWatchfit(String fit) async {
    log(fit);
    try {
      Response response = await Dio()
          .get("http://10.0.2.2:3000/api/menzclub/watch/fit?watch_fit=$fit");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

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
