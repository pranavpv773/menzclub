import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/user/model/prodout_model.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class UserCartApiService {
  Future<UserModel> cartUserData(data, Product product) async {
    try {
      Response response = await Dio().post(
          '${ApiEndPoints.baseUrl}/api/add-to-cart${product.id}',
          data: product.toJson());
      if (response.statusCode! == 200) {
        log(response.data.toString());
        return UserModel.fromJson(response.data);
      } else {
        return UserModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return UserModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return UserModel(
        user: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
