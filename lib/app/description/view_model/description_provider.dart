// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/description/view/widgets/alert_box.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider.dart';
import 'package:menz_cart_app/app/order_summary/view_model/order_provider.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DescriptionProvider with ChangeNotifier {
  void selectedItem(
    BuildContext context,
    item,
    name,
    description,
    images,
    price,
    offer,
    id,
    category,
    color,
    brand,
    size,
    material,
  ) {
    switch (item) {
      case 0:
        context.read<LoginProvider>().isLogged
            ? context.read<UserProvider>().userList[0].address == ""
                ? Fluttertoast.showToast(
                    msg: "Please Add your address",
                    toastLength: Toast.LENGTH_LONG,
                  )
                : context.read<OrderNotifier>().orderProduct(
                      context,
                      name,
                      description,
                      images,
                      price,
                      offer,
                      id,
                      category,
                      color,
                      brand,
                      size,
                      material,
                    )
            : loginDialog(context);
        break;
      case 1:
        context.read<LoginProvider>().isLogged
            ? context.read<CartProvider>().addToCart(
                  context,
                  name,
                  description,
                  images,
                  price,
                  offer,
                  id,
                  category,
                  color,
                  brand,
                  size,
                  material,
                )
            : loginDialog(context);
        break;
    }
  }

  Future<dynamic> loginDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertboxWidget(
          title: 'You have to login first',
          btn: 'Cancel',
          function: () => RoutesProvider.backScreen(),
        );
      },
    );
  }
}
