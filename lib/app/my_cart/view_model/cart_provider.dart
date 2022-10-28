// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartProvider with ChangeNotifier {
  addToCart(
    BuildContext context,
    String name,
    String description,
    images,
    int price,
    int offer,
    String id,
    category,
    color,
    brand,
    int size,
    String material,
  ) async {
    final vaal = productCheck(context, id);
    if (vaal == false) {
      final userCart = UserCart(
        id: id,
        productName: name,
        productDescription: description,
        images: [images],
        productPrice: price,
        productOffer: offer,
        productCategory: category,
        productColor: color.toString(),
        productBrand: brand.toString(),
        productSize: size,
        productMaterial: material.toString(),
      );
      final datas = Cart(
        userMail: context.read<UserProvider>().userList[0].userMail,
        userCart: [userCart],
      );
      CartRespoModel resp = await CartApiServices().addToCart(context, datas);

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
    } else {
      Fluttertoast.showToast(
        msg: "Product already added to cart",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  bool productCheck(BuildContext context, String id) {
    bool boole = false;
    for (int i = 0; i < context.read<CartNotifier>().cartList.length; i++) {
      if (context.read<CartNotifier>().cartList[i].userCart[0].id == id) {
        boole = true;
        break;
      }
    }
    log(boole.toString());
    return boole;
  }
}
