import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_material.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';

import 'widgets/shirt_category.dart';
import 'widgets/top_collecton.dart';

class ShirtScreen extends StatelessWidget {
  const ShirtScreen({Key? key, required this.string}) : super(key: key);
  final String string;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(string.toUpperCase()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  children: [
                    HomeCarouselBanners(
                      width: width,
                      heights: height / 2,
                      list: shirts,
                    ),
                    const DotIndicator(),
                    ShirtCategoryCards(
                      width: width,
                      height: height,
                    ),
                    TopCollectionsWidget(
                      height: height,
                      width: width,
                    ),
                    ShirtFitWidget(
                      topic: 'SHOP SHIRT BY FIT',
                      color: Colors.black,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      image: 'assets/banners/shirt1.jpeg',
                      image2: 'assets/banners/shirt2.jpeg',
                      height: height,
                      width: width,
                    ),
                    Column(
                      children: [
                        ShirtContentBanner(
                          color: Colors.black,
                          width: width,
                          height: height,
                          image: 'assets/banners/shirt3.jpg',
                          topic: 'SHOP  BY COLOR',
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        ShirtBannerBuilder(
                          width: width,
                          height: height,
                        )
                      ],
                    ),
                    ShirtMaterialWidget(height: height),
                    sizedBox50,
                    sizedBox50,
                  ],
                ),
                const ShopNowButton(
                  screen: ProductsScreen(
                    list: shirtList,
                    title: 'SHIRTS',
                  ),
                  textButton: 'SHOP ALL SHIRTS',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
