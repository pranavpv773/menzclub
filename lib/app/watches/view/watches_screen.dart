import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/collections.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/offer_by_prize.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/shoes_color_builder.dart';
import 'package:menz_cart_app/app/shoes/view/widgets/sort_by_size.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_map.dart';

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
                    OfferByPrize(width: width, height: height)
                  ],
                ),
                sizedBox50,
                const ShopNowButton(
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
