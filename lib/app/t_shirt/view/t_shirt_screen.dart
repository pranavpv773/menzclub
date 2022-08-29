import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 't_shirt_by_color.dart';
import 'widgets/category_builder.dart';
import 'widgets/t_shirt_banner.dart';
import 'widgets/tshirt_banner.dart';

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
          title: GradientText(
            'T-SHIRT',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.alumniSans().fontFamily),
            colors: [
              kWhite,
              const Color.fromARGB(255, 235, 194, 238),
              const Color.fromARGB(255, 186, 122, 199),
            ],
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
                  TshirtofferCard(width: width, height: height),
                  ShirtFitWidget(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    image: 'assets/tshirt/banner1.jpeg',
                    image2: 'assets/banners/tshirt.jpg',
                    height: height,
                    width: width,
                  ),
                  TshirtByColor(width: width, height: height),
                  sizedBox50,
                  sizedBox50,
                ],
              ),
              const ShopNowButton(
                textButton: 'SHOP ALL T-SHIRTS',
              )
            ],
          ),
        ),
      ),
    );
  }
}