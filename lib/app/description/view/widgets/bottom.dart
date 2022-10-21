import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/description/view_model/description_provider.dart';
import 'package:provider/provider.dart';

class BottomTab extends StatelessWidget {
  const BottomTab(
      {Key? key,
      required this.width,
      required this.color,
      required this.index,
      required this.name,
      required this.description,
      required this.images,
      required this.price,
      required this.productName,
      required this.offer,
      required this.id})
      : super(key: key);

  final double width;
  final Color color;
  final String name;
  final int index;
  final String description, images, price, offer, productName, id;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2.1,
      color: color,
      child: TextButton(
        onPressed: () {
          context.read<DescriptionProvider>().selectedItem(context, index,
              productName, description, images, price, offer, id);
        },
        child: Text(
          name,
          style: TextStyle(
            color: AppColor.kWhite,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
