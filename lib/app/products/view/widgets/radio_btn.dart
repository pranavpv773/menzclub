import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:provider/provider.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(icon),
      color: kWhite,
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text('Prize-- Low to High'),
            title: Radio(
              value: 0,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(value);
              },
              activeColor: primary,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text('Prize-- Low to High'),
            title: Radio(
              value: 1,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(value);
              },
              activeColor: primary,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text('Prize-- Low to High'),
            title: Radio(
              value: 2,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(value);
              },
              activeColor: primary,
            ),
          ),
        ),
      ],
      onSelected: (item) {
        // context.read<ServicesProvider>().selectedItem(context, item);
      },
    );
  }
}
