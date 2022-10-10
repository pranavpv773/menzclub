import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_map.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider_two.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class JeansColorBuilder extends StatelessWidget {
  const JeansColorBuilder({
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
        maxCrossAxisExtent: 200,
        mainAxisExtent: height / 5,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 40,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () async {
            await context
                .read<JeansProviderTwo>()
                .fetchjeansColor(jeansList[index]['color'].toString());
            RoutesProvider.nextScreen(
              screen: ProductsScreen(
                title: jeansList[index]['color'].toString(),
                // ignore: use_build_context_synchronously
                list: context.read<JeansProviderTwo>().jeanscolor,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              shadowColor: AppColor.primary2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width / 5,
                        height: height / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage(
                                jeansList[index]['colorpantImage'].toString(),
                              ),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Text(jeansList[index]['color'].toString()),
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
