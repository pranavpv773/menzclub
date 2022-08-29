import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/jeans/view/widgets/budget_buys.dart';
import 'package:menz_cart_app/app/jeans/view/widgets/grab_offers.dart';
import 'package:menz_cart_app/app/jeans/view/widgets/jeans_color_builder.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/top_collecton.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/collections.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/sort_by_size.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';

class ShoesScreen extends StatelessWidget {
  const ShoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 15),
        child: const CommonAppBarWidget(
          section: 'SHOES',
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
                  list: shoes,
                ),
                const DotIndicator(),
                sizedBox20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Center(
                      child: Text('TOP COLLECTIONS'),
                    ),
                    ShoesCollectionBuilder(width: width, height: height),
                  ],
                ),
                BudgetBuysJeans(
                  width: width,
                  height: height,
                ),
                SortBySize(height: height, width: width),
                Column(children: [
                  ShirtContentBanner(
                    color: Colors.brown,
                    width: width,
                    height: height,
                    image: 'assets/jeans/images.jpeg',
                    topic: 'SHOP  BY COLOR',
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  JeansColorBuilder(
                    width: width,
                    height: height,
                  )
                ]),
                sizedBox50,
                const ShopNowButton(
                  textButton: 'SHOP ALL SHOES',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
