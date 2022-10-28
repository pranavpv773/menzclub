// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services_get.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services_remove.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class CartNotifier with ChangeNotifier {
  List<Cart> cartList = [];
  Future<void> fetchUserCart(BuildContext context) async {
    final mail = context.read<UserProvider>().userList[0].userMail;
    CartModel resp = await CartGetApiService().fetchCart(mail);

    if (resp.status && resp.cart.isNotEmpty) {
      cartList.clear();
      cartList.addAll(resp.cart);
      notifyListeners();
    } else {
      cartList.clear();
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Your Cart is empty",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<void> removeCart(BuildContext context, String id) async {
    CartRespoModel resp = await CartRemoveApi().removeFromCart(context, id);

    if (resp.status) {
      context.read<CartNotifier>().fetchUserCart(context);

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
