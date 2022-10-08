import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/login/model/login_model.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class UserApiService {
  Future<UserMainModel> getUserData(String mail) async {
    log('reached get user');
    try {
      Response response = await Dio().post(
        ApiEndPoints.loginAPI,
      );
      if (response.statusCode! >= 200) {
        log('reached Dio');
        log(response.data.toString());
        return UserMainModel.fromJson(response.data);
      } else {
        return UserMainModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return UserMainModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return UserMainModel(userModel: [], status: false, message: e.toString());
    }
  }
}
