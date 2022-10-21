// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/products/model/product_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  List<Cart> cartList = [];
  List<ProductModel> cartAdd = [];
  transferingToList(list) async {
    for (int i = 0; i <= list.length; i++) {
      cartAdd.add(list);
      log(list.toString());
    }
    cartList.clear();

    notifyListeners();
  }

  addToCarta(BuildContext context, data) async {
    await transferingToList(data);
    final datas = Cart(
      userMail: context.read<UserProvider>().userList[0].userMail,
      userCart: cartAdd,
    );
    CartModel resp = await CartApiServices().addToCart(context, datas);

    if (resp.status && resp.cart.isNotEmpty) {
      cartList.addAll(resp.cart);
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
