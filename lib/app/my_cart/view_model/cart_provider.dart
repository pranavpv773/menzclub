// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartProvider with ChangeNotifier {
  List<Cart> cartList = [];
  // List<UserCart> cartAdd = [];
  addToCart(
      BuildContext context, name, description, images, price, offer, id) async {
    final list = [name, description, id ?? "", images, price, offer];
    final datas = Cart(
      userMail: context.read<UserProvider>().userList[0].userMail,
      userCart: list,
    );
    CartRespoModel resp = await CartApiServices().addToCart(context, datas);

    if (resp.status) {
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
