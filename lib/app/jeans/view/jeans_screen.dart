import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/jeans/view/widgets/budget_buys.dart';
import 'package:menz_cart_app/app/jeans/view/widgets/grab_offers.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/jeans_color_builder.dart';

class JeansScreen extends StatelessWidget {
  const JeansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 15),
        child: const CommonAppBarWidget(
          section: 'JEANS',
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
                  list: jeans,
                ),
                const DotIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    color: const Color.fromARGB(231, 23, 23, 42),
                    child: ShirtFitWidget(
                      type: ActionType.jeans,
                      list: context.read<JeansProvider>().jeansFitList,
                      topic: 'SHOP JEANS BY FIT',
                      color: AppColor.kWhite,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      image: 'assets/jeans/banner2.jpg',
                      image2: 'assets/jeans/lanel_jeans.jpg',
                      height: height,
                      width: width,
                    ),
                  ),
                ),
                BudgetBuysJeans(
                  width: width,
                  height: height,
                ),
                JeansGrabOffers(height: height, width: width),
                Column(
                  children: [
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
                  ],
                ),
                sizedBox50,
                ShopNowButton(
                  screen: ProductsScreen(
                    list: context.read<JeansProvider>().jeansList,
                    title: 'JEANS',
                  ),
                  textButton: 'SHOP ALL JEANS',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
