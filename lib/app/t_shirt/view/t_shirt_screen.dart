import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:provider/provider.dart';
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
          backgroundColor: AppColor.primary,
          title: GradientText(
            'T-SHIRT',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.alumniSans().fontFamily),
            colors: [
              AppColor.kWhite,
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
                    type: ActionType.tshirt,
                    list: context.read<TshirtProvider>().tShirtFitList,
                    topic: 'SHOP T-SHIRT BY FIT',
                    color: Colors.black,
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
              ShopNowButton(
                screen: ProductsScreen(
                  title: 'T-Shirts',
                  list: context.read<TshirtProvider>().tShirtList,
                ),
                textButton: 'SHOP ALL T-SHIRTS',
              )
            ],
          ),
        ),
      ),
    );
  }
}
