import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:menz_cart_app/app/home/model/banner_model.dart';
import 'package:menz_cart_app/services/api_endpoints.dart';

class BannerApiService {
  Future<BannerModel> fetchBanner(String banners) async {
    try {
      Response response =
          await Dio().get("${ApiEndPoints.getHomeBanner}$banners");
      if (response.statusCode == 200) {
        return BannerModel.fromJson(response.data);
      } else {
        return BannerModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log('message');
      return BannerModel.fromJson(e.response!.data);
    } catch (e) {
      log(e.toString());
      return BannerModel(status: false, message: e.toString(), banner: []);
    }
  }
}
