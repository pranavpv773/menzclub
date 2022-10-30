// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/order_summary/api_services/api_services_get.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class OrderNotifierTwo with ChangeNotifier {
  List<Order> orderList = [];
  bool isLoad = false;
  Future<void> fetchUserOrder(BuildContext context) async {
    isLoad = true;
    notifyListeners();
    final mail = context.read<UserProvider>().userList[0].userMail;
    OrderResponseModel resp = await OrderGetApiService().fetchOrder(mail);

    if (resp.status && resp.orders.isNotEmpty) {
      orderList.clear();
      orderList.addAll(resp.orders);
      isLoad = false;
      notifyListeners();
    } else {
      orderList.clear();
      isLoad = false;
      notifyListeners();
      Fluttertoast.showToast(
        msg: "Your Cart is empty",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
