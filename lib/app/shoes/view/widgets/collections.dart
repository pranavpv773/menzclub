import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_map.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ShoesCollectionBuilder extends StatelessWidget {
  const ShoesCollectionBuilder({
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
        maxCrossAxisExtent: 150,
        mainAxisExtent: height / 5,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: GestureDetector(
            onTap: () async {
              await context.read<ShoesProviderTwo>().fetchShoesCollection(
                    shoesMap[index]['categary'].toString(),
                  );
              RoutesProvider.nextScreen(
                  screen: ProductsScreen(
                title: shoesMap[index]['categary'].toString(),
                // ignore: use_build_context_synchronously
                list: context.read<ShoesProviderTwo>().shoesCollection,
              ));
            },
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10,
              shadowColor: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primary1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width / 2,
                        height: height / 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(
                              shoesMap[index]['collectionImage'].toString(),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 166, 232, 11),
                      ),
                      child: Center(
                        child: Text(
                          shoesMap[index]['categary'].toString(),
                        ),
                      ),
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
