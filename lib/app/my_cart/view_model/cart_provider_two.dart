// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/description/api_services/api_services.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services_get.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class CartNotifier with ChangeNotifier {
  List<Cart> cartList = [];
  Future<void> fetchCart(BuildContext context) async {
    final mail = context.read<UserProvider>().userList[0].userMail;
    CartModel resp = await CartGetApiService().fetchCart(mail);

    if (resp.status && resp.cart.isNotEmpty) {
      cartList.clear();
      log("Cartlist");
      log(resp.cart.toString());
      cartList.addAll(resp.cart);
      notifyListeners();

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> removeCart(BuildContext context, String id) async {
    CartRespoModel resp = await CartRemove().removeFromCart(context, id);

    if (resp.status) {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
