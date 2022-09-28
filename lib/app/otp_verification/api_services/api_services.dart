import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/otp_verification/model/otp_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OtpApiService {
  Future<OtpVerifyResponse> otpVerified(OtpModel data) async {
    log(data.userOtp.toString());
    try {
      Response response =
          await Dio().post(ApiEndPoints.otpVerifyAPI, data: data.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data..toString());
        return OtpVerifyResponse.fromJson(response.data);
      } else {
        log('2executed');
        return OtpVerifyResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      return OtpVerifyResponse(status: false, message: e.message);
    } catch (e) {
      print(e.toString());
      return OtpVerifyResponse(status: false, message: e.toString());
    }
  }
}
