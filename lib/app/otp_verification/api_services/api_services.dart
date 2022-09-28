import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/otp_verification/model/otp_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OtpApiService {
  static otpVerified(OtpModel data) async {
    try {
      Response response =
          await Dio().post(ApiEndPoints.otpVerifyAPI, data: data.toJson());
      if (response.statusCode == 200) {
        log(response.data.toString());
        return EmailSigninResp.fromJson(response.data);
      } else {
        return EmailSigninResp.fromJson(response.data);
      }
    } on DioError catch (e) {
      return EmailSigninResp.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return EmailSigninResp(status: false, message: e.toString());
    }
  }
}
