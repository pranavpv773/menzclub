// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/order_summary/api_services/api_services.dart';
import 'package:menz_cart_app/app/order_summary/model/order_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/order_summary/model/response_model.dart';

class OrderNotifier with ChangeNotifier {
  orderProduct(
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
    log("fn");
    final product = Product(
      productId: id,
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
    final data = Order(
      products: [product],
      totalPrice: 25,
      address: "heello",
      userMail: AppTextStyles.payEmail,
    );

    ResponseModel resp = await OrderApi().orderProduct(context, data);

    if (resp.status!) {
      Fluttertoast.showToast(
        msg: resp.message!,
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: resp.message!,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
}
