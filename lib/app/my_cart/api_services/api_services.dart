// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:menz_cart_app/app/user/model/prodout_model.dart';
// import 'package:menz_cart_app/app/user/model/user_model.dart';
// import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
// import 'package:menz_cart_app/services/api_endpoints.dart';
// import 'package:provider/provider.dart';

// class CartApiServices {
//   Future<UserModel> addToCart(BuildContext context,Product product) async {
//     log('reached cart');
//     try {
//       Response response = await Dio().post("${ApiEndPoints.getShirts}$",data: );
//       if (response.statusCode == 200) {
//         final userProvider = Provider.of<UserProvider>(context, listen: false);
//         userProvider.user.copyWith(cart: jsonDecode(response.data)['cart']);
//         return UserModel.fromJson(response.data);
//       } else {
//         return UserModel.fromJson(response.data);
//       }
//     } on DioError catch (e) {
//       log('message');
//       return UserModel.fromJson(e.response!.data);
//     } catch (e) {
//       log(e.toString());
//       return UserModel(
//         user: [],
//         status: false,
//         message: e.toString(),
//       );
//     }
//   }
// }
