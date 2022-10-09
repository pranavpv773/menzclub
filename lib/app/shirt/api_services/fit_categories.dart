import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShirtFitApiServices {
  Future<ShirtModel> fetchShirtfit(String fit) async {
    log(fit);
    try {
      Response response = await Dio()
          .get("${ApiEndPoints.baseUrl}/api/menzclub/fit?shirt_fit=$fit");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

        return ShirtModel.fromJson(response.data);
      } else {
        return ShirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ShirtModel(
        shirt: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
