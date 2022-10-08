// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartProvider with ChangeNotifier {
  List<UserModel> cartList = [];
  fetchShirtColor(BuildContext context) async {
    UserModel resp = await CartApiServices().addToCart();

    if (resp.status && resp.user.isNotEmpty) {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
