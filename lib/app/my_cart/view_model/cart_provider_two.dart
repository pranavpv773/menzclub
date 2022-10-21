// // ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:menz_cart_app/app/my_cart/api_services/api_services_get.dart';
// import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class CartNotifier with ChangeNotifier {
//   List<Cart> cartList = [];
//   // List<UserCart> cartAdd = [];
//   Future<void> fetchCart() async {
//     CartRespoModel resp = await CartGetApiService().fetchProducts();

//     if (resp.status && resp.cart.isNotEmpty) {
//       cartList.clear();
//       log(resp.cart.toString());
//       cartList.addAll(resp.cart);
//       notifyListeners();

//       notifyListeners();
//     } else {
//       Fluttertoast.showToast(
//         msg: resp.message,
//         toastLength: Toast.LENGTH_LONG,
//       );
//     }
//   }
// }
