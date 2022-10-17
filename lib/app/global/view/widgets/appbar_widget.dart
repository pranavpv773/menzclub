// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/search/view_model/search_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ActiveApppbarWidget extends StatelessWidget {
  const ActiveApppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: AppColor.primary1,
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: AppColor.kWhite,
            leading: Image.asset(
              'assets/mc.png',
            ),
            primary: false,
            title: TextFormField(
              controller: context.read<SearchProvider>().searchController,
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColor.primary,
                ),
                onPressed: () async {
                  await context
                      .read<SearchProvider>()
                      .onChangeFunction(context);
                  RoutesProvider.nextScreen(
                    screen: ProductsScreen(
                      title:
                          context.read<SearchProvider>().searchController.text,
                      list: context.read<SearchProvider>().temp,
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: AppColor.primary,
                ),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
