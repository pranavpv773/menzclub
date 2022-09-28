import 'package:dio/dio.dart';

class ApiServices {
  getApi(String endPoint) async {
    return await Dio().get(endPoint);
  }
}
