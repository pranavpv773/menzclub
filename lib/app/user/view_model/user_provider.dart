import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:menz_cart_app/app/user/api_service/api_services.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class UserProvider extends ChangeNotifier {
  List<User> UserList = [];
  final securedStorage = const FlutterSecureStorage();
  Future<void> onTabGetUser(String mail) async {
    UserModel resp = await UserApiService().getUserData(mail);

    if (resp.status) {
      UserList.addAll(resp.user);
      // log("${UserList}");
      log("get user");
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    } else {
      log('message of error');
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
