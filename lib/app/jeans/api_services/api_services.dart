import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class JeansApiService {
  Future<JeansModel> fetchProducts() async {
    log('reached jeans');
    try {
      Response response = await Dio().get(ApiEndPoints.getJeans);
      if (response.statusCode == 200) {
        log("jeans success");
        // final jsonData = response.data as List;
        // final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        return JeansModel.fromJson(response.data);
      } else {
        return JeansModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return JeansModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return JeansModel(status: false, message: e.toString(), jeans: []);
    }
  }
}
