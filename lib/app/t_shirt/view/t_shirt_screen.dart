import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/carousel_banner.dart';
import 'package:menz_cart_app/app/home/view/widgets/circle_dot.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_category.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_material.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/top_collecton.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt.dart';
import 'package:menz_cart_app/app/utilities/view/container_network.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'widgets/t_shirt_banner.dart';

class TshirtScreen extends StatelessWidget {
  const TshirtScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: Text(
            'T-Shirts'.toUpperCase(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Column(
                children: [
                  TshirtBannerWidget(width: width, height: height),
                  sizedBox20,
                  const TshirtCategoryWidget(
                    text: 'WHAT ARE YOU LOOKING FOR?',
                  ),
                  TshirtCategoryBuilderWidget(width: width, height: height),
                  const TshirtCategoryWidget(
                    text: 'BUDGET BUYS',
                  ),
                  TopCollectionsWidget(
                    height: height,
                    width: width,
                  ),
                  ShirtFitWidget(
                    height: height,
                    width: width,
                  ),
                  Column(
                    children: [
                      ShirtContentBanner(
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
                textButton: 'SHOP ALL SHIRTS',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TshirtCategoryWidget extends StatelessWidget {
  const TshirtCategoryWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GradientText(
          text,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.alumniSans().fontFamily),
          colors: [
            primary,
            Color.fromARGB(255, 236, 29, 255),
            const Color.fromARGB(255, 146, 8, 174),
          ],
        ),
      ),
    );
  }
}

class TshirtCategoryBuilderWidget extends StatelessWidget {
  const TshirtCategoryBuilderWidget({
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
        mainAxisExtent: height / 6,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 1,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext ctx, index) {
        return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                // color: primary,
                image: DecorationImage(
                    image: AssetImage('assets/frames/neon2.png'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: width / 4.5,
                  height: height / 9,
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(101, 158, 158, 158),
                      ),
                  child: Image.asset(
                    tShirtList[index]['categoryImage'].toString(),
                    width: width / 3,
                    height: height / 8,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                tShirtList[index]['categary'].toString(),
                style: TextStyle(
                    fontSize: 15, fontFamily: GoogleFonts.benne().fontFamily),
              ),
            )
          ],
        );
      },
    );
  }
}
