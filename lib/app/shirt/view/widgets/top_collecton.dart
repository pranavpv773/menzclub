// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class TopCollectionsWidget extends StatelessWidget {
  const TopCollectionsWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const Text("TOP COLLECTIONS"),
          GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: height / 3.5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ShirtProviderTwo>().fetchShirtCollection(
                          shirtList[index]['topcollection'].toString(),
                        );
                    RoutesProvider.nextScreen(
                        screen: ProductsScreen(
                      title: shirtList[index]['topcollection'].toString(),
                      list: context.read<ShirtProviderTwo>().shirtCollection,
                    ));
                  },
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Container(
                      color: AppColor.kWhite,
                      child: Column(
                        children: [
                          Container(
                            width: width / 2.5,
                            height: height / 4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  shirts[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            shirtList[index]['topcollection'].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
