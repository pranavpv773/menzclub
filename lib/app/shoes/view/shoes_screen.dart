import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
import 'package:menz_cart_app/app/shoes/view/widgets/shoes_color_builder.dart';
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
                SortBySize(height: height, width: width),
                Column(
                  children: [
                    ShirtContentBanner(
                      color: Colors.white,
                      width: width,
                      height: height,
                      image: 'assets/shoes/color.jpg',
                      topic: 'SHOP  BY COLOR',
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                    ShoesColorBuilder(
                      width: width,
                      height: height,
                    ),
                    Container(
                      width: width,
                      height: height / 4,
                      color: const Color.fromARGB(255, 200, 234, 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "OFFER BY PRIZE",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: GoogleFonts.notoSerif().fontFamily,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatharOffer(
                                width: width,
                                offer: '1500',
                              ),
                              CircleAvatharOffer(
                                width: width,
                                offer: '3000',
                              ),
                              CircleAvatharOffer(
                                width: width,
                                offer: '5000',
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                sizedBox50,
                const ShopNowButton(
                  textButton: 'SHOP ALL SHOES',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleAvatharOffer extends StatelessWidget {
  const CircleAvatharOffer({
    Key? key,
    required this.width,
    required this.offer,
  }) : super(key: key);

  final double width;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: width / 6.6,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        minRadius: width / 7,
        backgroundColor: kWhite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "UNDER",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                offer,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
