import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/user/api_service/api_services.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';

class UserProvider extends ChangeNotifier {
  List<User> userList = [];
  final securedStorage = const FlutterSecureStorage();
  List<User> users = [];
  Future<void> onTabGetUser(String mail) async {
    UserModel resp = await UserApiService().getUserData(mail);

    if (resp.status) {
      userList.addAll(resp.user);
      users = resp.user;
      AppTextStyles.payName = resp.user[0].userNumber;
      AppTextStyles.payEmail = resp.user[0].userMail;
      var split = resp.user[0].address.split('\n').map((i) {
        if (i == ",") {
          return const Divider();
        } else {
          return Text(i);
        }
      }).toList();
      AppTextStyles.userAddress = Column(children: split);
      log(AppTextStyles.userAddress.toString());
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

  User _user = User(
    id: '',
    userName: '',
    userMail: '',
    userPassword: '',
    address: '',
    userNumber: 0,
  );

  User get user => _user;

  void setUser(user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
