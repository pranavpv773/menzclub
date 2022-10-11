import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:provider/provider.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: AppColor.kWhite,
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text(
              'Prize-- Low to High',
            ),
            title: Radio(
              value: 0,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(
                      value,
                    );
              },
              activeColor: AppColor.primary,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text(
              'Prize-- Low to High',
            ),
            title: Radio(
              value: 1,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(
                      value,
                    );
              },
              activeColor: AppColor.primary,
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 0,
          child: ListTile(
            leading: const Text(
              'Prize-- Low to High',
            ),
            title: Radio(
              value: 2,
              groupValue: context.read<ProductsProvider>().val,
              onChanged: (value) {
                context.read<ProductsProvider>().chekRadio(
                      value,
                    );
              },
              activeColor: AppColor.primary,
            ),
          ),
        ),
      ],
      onSelected: (item) {
        // context.read<ServicesProvider>().selectedItem(context, item);
      },
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: Text('SORT'),
          ),
          Icon(
            Icons.sort,
          )
        ],
      ),
    );
  }
}
