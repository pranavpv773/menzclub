// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/my_cart/api_services/api_services.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_get_model.dart';
import 'package:menz_cart_app/app/my_cart/model/cart_model.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartProvider with ChangeNotifier {
  addToCarts(
    BuildContext context,
    String name,
    String description,
    images,
    price,
    offer,
    id,
    category,
    color,
    brand,
    size,
    String material,
  ) async {
    final userCart = UserCart(
      productName: name,
      productDescription: description,
      images: [images],
      productPrice: int.parse(price),
      productOffer: int.parse(offer),
      productCategory: category,
      productColor: color.toString(),
      productBrand: brand.toString(),
      productSize: int.parse(size),
      productMaterial: material.toString(),
    );
    final datas = Cart(
      userMail: context.read<UserProvider>().userList[0].userMail,
      userCart: [userCart],
    );
    CartRespoModel resp = await CartApiServices().addToCart(context, datas);

    if (resp.status) {
      context.read<CartNotifier>().fetchCart(context);
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
