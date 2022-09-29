import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/sign_up/model/sign_up_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class SignupApiService {
  Future<SignUpResponse?> signUp(SignUpModel data) async {
    log('reached on sign up');
    try {
      Response response =
          await Dio().post(ApiEndPoints.signUpAPI, data: data.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('signup ${response.data.toString()}');

        return SignUpResponse.fromJson(response.data);
      } else {
        return SignUpResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return SignUpResponse.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return SignUpResponse(status: false, message: e.toString());
    }
  }
}
