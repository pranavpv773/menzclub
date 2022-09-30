import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';
import 'package:menz_cart_app/app/shirt/view_model/shit_provider.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShirtApiServices {
  static fetchProducts() async {
    ShirtProvider.shirtList.clear();
    log('reached Login');
    try {
      Response response = await Dio().get(ApiEndPoints.getShits);
      if (response.statusCode == 200) {
        final jsonData = response.data as List;
        final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        ShirtProvider.shirtList.addAll(newList);
      } else {
        return EmailSigninResp.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return EmailSigninResp.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return EmailSigninResp(status: false, message: e.toString());
    }
  }
}
