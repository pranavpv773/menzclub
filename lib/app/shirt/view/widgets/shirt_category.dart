import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider_two.dart';
import 'package:menz_cart_app/app/utilities/view/container_network.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ShirtCategoryCards extends StatelessWidget {
  const ShirtCategoryCards({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          mainAxisExtent: height / 5.3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 50,
          mainAxisSpacing: 0,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              final String category =
                  shirtCategoryList[index]['category'].toString();
              context.read<ShirtProviderTwo>().fetchShirtCategory(
                    category,
                  );
              RoutesProvider.nextScreen(
                screen: ProductsScreen(
                  title: shirtCategoryList[index]['category'].toString(),
                  // ignore: use_build_context_synchronously
                  list: context.read<ShirtProviderTwo>().shirtCategory,
                ),
              );
            },
            child: ShirtCategories(
              width: width,
              height: height,
              image: shirtCategoryList[index]['image'].toString(),
              caption: shirtCategoryList[index]['category'].toString(),
            ),
          );
        });
  }
}

class ShirtCategories extends StatelessWidget {
  const ShirtCategories({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.caption,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerImage(
          width: width,
          height: height,
          image: image,
        ),
        Text(
          caption,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.abhayaLibre().fontFamily,
          ),
        )
      ],
    );
  }
}
