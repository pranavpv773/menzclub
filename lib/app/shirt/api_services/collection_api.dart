import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';

class ShirtCollectionApiServices {
  Future<ShirtModel> fetchShirtCollection(String collection) async {
    log(collection);
    try {
      Response response = await Dio().get(
          'http://10.0.2.2:3000/api/menzclub/collection?shirt_collection=$collection');
      if (response.statusCode == 200) {
        return ShirtModel.fromJson(response.data);
      } else {
        return ShirtModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShirtModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return ShirtModel(
        shirt: [],
        status: false,
        message: e.toString(),
      );
    }
  }
}
