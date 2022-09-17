import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/services/dio_service.dart';

class ApiService {
  static login(data) async {
    Response response = await DioService.postMethod(
        url: 'http://10.0.2.2:8000/account/login', data: data);

    if (response.statusCode == 200) {
      return EmailSigninResp.fromJson(response.data);
    } else {
      return EmailSigninResp.fromJson(response.data);
    }
  }
}
