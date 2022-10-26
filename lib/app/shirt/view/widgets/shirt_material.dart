// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ShirtMaterialWidget extends StatelessWidget {
  const ShirtMaterialWidget({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://thumbs.dreamstime.com/b/texture-blue-decorative-plaster-concrete-vignette-abstract-grunge-background-design-234969184.jpg',
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "SHOP BY Material".toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                color: AppColor.kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        context.read<ShirtProviderTwo>().fetchShirtMaterial(
                            shirtList[index]['materialname'].toString());
                        RoutesProvider.nextScreen(
                          screen: ProductsScreen(
                            title: shirtList[index]['materialname'].toString(),
                            list:
                                context.read<ShirtProviderTwo>().shirtMaterial,
                          ),
                        );
                      },
                      child: Container(
                        height: height / 12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              shirtList[index]['material'].toString(),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            shirtList[index]['materialname'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.kWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
