import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class OrderGetApiService {
  Future<OrderResponseModel> fetchOrder(String mail) async {
    try {
      Response response = await Dio().get("${ApiEndPoints.fetchorder}$mail");
      if (response.statusCode == 200) {
        return OrderResponseModel.fromJson(response.data);
      } else {
        return OrderResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      return OrderResponseModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return OrderResponseModel(
          status: false, message: e.toString(), orders: []);
    }
  }
}
