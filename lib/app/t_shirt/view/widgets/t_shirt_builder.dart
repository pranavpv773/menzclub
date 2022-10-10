// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class TshirtColorBuilder extends StatelessWidget {
  const TshirtColorBuilder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 130,
        mainAxisExtent: height / 5,
        crossAxisSpacing: 20,
        mainAxisSpacing: height / 50,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () async {
            await context.read<TshirtProviderTwo>().fetchShirtColor(
                  tShirtList[index]['color'].toString(),
                );
            RoutesProvider.nextScreen(
                screen: ProductsScreen(
              title: tShirtList[index]['color'].toString(),
              list: context.read<TshirtProviderTwo>().tShirtcolor,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              shadowColor: Colors.black,
              child: Container(
                width: width / 8,
                decoration: BoxDecoration(
                  color: AppColor.primary1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/tshirt/neon_border.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width / 5,
                          height: height / 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(
                                tShirtList[index]['WatchcolorImage'].toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      tShirtList[index]['color'].toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
