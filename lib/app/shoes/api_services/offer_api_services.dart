import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/shoes/model/shoes_model.dart';

class ShoesOfferApiServices {
  Future<ShoesModel> fetchShoesoffer(int price) async {
    try {
      Response response = await Dio()
          .get("http://10.0.2.2:3000/api/menzclub/shoes/price/$price");
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
