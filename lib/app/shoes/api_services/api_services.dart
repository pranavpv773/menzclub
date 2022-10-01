import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/jeans/model/jean_model.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class ShoesApiService {
  Future<ShoesModel> fetchProducts(BuildContext context) async {
    log('reached shirt');
    try {
      Response response = await Dio().get(ApiEndPoints.getshoes);
      if (response.statusCode == 200) {
        // final jsonData = response.data as List;
        // final newList = jsonData.map((e) => ShirtModel.fromJson(e)).toList();
        return ShoesModel.fromJson(response.data);
      } else {
        return ShoesModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return ShoesModel.fromJson(e.response!.data);
    } catch (e) {
      print(e.toString());
      return ShoesModel(status: false, message: e.toString(), shoes: []);
    }
  }
}
