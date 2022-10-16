// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/user/api_service/cart_api_services.dart';
import 'package:menz_cart_app/app/user/model/prodout_model.dart';
import 'package:menz_cart_app/app/user/model/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  List<UserModel> cartList = [];
  fetchShirtColor(BuildContext context, Product product, data) async {
    final data = context.read<UserProvider>().users;
    UserModel resp = await UserCartApiService().cartUserData(data!, product);

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
