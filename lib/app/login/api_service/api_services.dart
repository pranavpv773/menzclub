import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ApiService {
  static login(EmailSignin data) async {
    log('reached Login');
    try {
      Response response =
          await Dio().post(ApiEndPoints.loginAPI, data: data.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('reached Dio');
        log(response.data.toString());
        return EmailSigninResp.fromJson(response.data);
      } else {
        return EmailSigninResp.fromJson(response.data);
      }
    } catch (e) {
      return Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
      );
    }
    // } catch (e) {
    //   print(e.toString());
    //   return EmailSigninResp(status: false, message: e.toString());
    // }
  }
}
