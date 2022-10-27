import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: const Text("Checkout"),
      ),
      body: Container(
        height: height / 10,
        decoration: BoxDecoration(color: AppColor.primary1),
        padding: const EdgeInsets.only(left: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Center(
                child: Text("Address"),
              ),
              Center(
                child: Text("Change Adress"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
