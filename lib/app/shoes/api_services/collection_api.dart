import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShoesCollectionApiServices {
  Future<ShoesModel> fetchShoesCollection(String collection) async {
    log(collection);
    try {
      Response response = await Dio().get(
          '${ApiEndPoints.baseUrl}/api/menzclub/shoes/collection?shoes_collection=$collection');
      if (response.statusCode == 200) {
        return ShoesModel.fromJson(response.data);
      } else {
        return ShoesModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShoesModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ShoesModel(
        shoes: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
