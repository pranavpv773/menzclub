import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/sign_up/model/sign_up_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class SignupApiService {
  static signUp(SignUpModel data) async {
    try {
      Response response =
          await Dio().post(ApiEndPoints.signUpAPI, data: data.toJson());
      if (response.statusCode == 200) {
        log('signup ${response.data.toString()}');

        return SignUpResponse.fromJson(response.data);
      } else {
        return SignUpResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      return SignUpResponse.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return SignUpResponse(status: false, message: e.toString());
    }
  }
}
