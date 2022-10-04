// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shirt/model/shirt_model.dart';

class ShirtCategoryApiServices {
  Future<ShirtModel> fetchShirtCollection(String collection) async {
    try {
      Response response = await Dio().get(
          'http://10.0.2.2:3000//api/menzclub/collection?shirt_collection=$collection');
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

  Future<ShirtModel> fetchShirtMaterial(String material) async {
    try {
      Response response = await Dio().get(
          "http://10.0.2.2:3000/api/menzclub/material?shirt_material=$material");
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

  Future<ShirtModel> fetchShirtCategory(String category) async {
    try {
      Response response = await Dio()
          .get("http://10.0.2.2:3000//api/menzclub?shirt_category=$category");
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

  Future<ShirtModel> fetchShirtfit(String fit) async {
    log(fit);
    try {
      Response response = await Dio()
          .get("http://10.0.2.2:3000/api/menzclub/fit?shirt_fit=$fit");
      if (response.statusCode == 200) {
        log('response.data');
        log(response.statusCode.toString());

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
