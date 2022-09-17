import 'package:dio/dio.dart';

class DioService {
  static Future<dynamic> getMethod({required String url}) {
    return Dio().get(url).then((value) => value);
  }

  static Future<dynamic>? postMethod({required String url, required var data}) {
    return Dio().post(url, data: data).then((value) => value);
  }
}
