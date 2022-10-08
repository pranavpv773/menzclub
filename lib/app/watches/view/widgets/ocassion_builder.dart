// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_map.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'ocasion_double.dart';

class OcassionBuilder extends StatelessWidget {
  const OcassionBuilder({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'SHOP BY OCCASION',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  await context.read<WatchProviderTwo>().fetchWatchCollection(
                        watchMap[index]['categary'].toString(),
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: watchMap[index]['categary'].toString(),
                    list: context.read<WatchProviderTwo>().watchCollection,
                  ));
                },
                child: Container(
                  height: height / 7,
                  color: const Color.fromARGB(59, 158, 158, 158),
                  child: index % 2 == 0
                      ? OcassionOddWidget(
                          index: index, height: height, width: width)
                      : OcassionEvenWidget(
                          index: index, height: height, width: width),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
