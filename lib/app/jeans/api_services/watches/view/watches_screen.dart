import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/app/watches/view/widgets/watch_prize.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/ocassion_builder.dart';
import 'widgets/watch_color_builder.dart';

class WatchesScreen extends StatelessWidget {
  const WatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 15),
        child: const CommonAppBarWidget(
          section: 'WATCHES',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                HomeCarouselBanners(
                  width: width,
                  heights: height / 2,
                  list: watchCollections,
                ),
                const DotIndicator(),
                sizedBox20,
                OcassionBuilder(height: height, width: width),
                Column(
                  children: [
                    ShirtContentBanner(
                      color: Colors.white,
                      width: width,
                      height: height,
                      image: 'assets/watches/color2.jpeg',
                      topic: 'SHOP  BY COLOR',
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    WatchColorBuilder(
                      width: width,
                      height: height,
                    ),
                    WatchShopByPrize(width: width, height: height)
                  ],
                ),
                sizedBox50,
                ShopNowButton(
                  screen: ProductsScreen(
                    list: context.read<WatchProvider>().watchList,
                    title: 'WATCHES',
                  ),
                  textButton: 'SHOP ALL WATCHES',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
