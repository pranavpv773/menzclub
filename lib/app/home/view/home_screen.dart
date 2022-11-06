import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/carousel_banner.dart';
import 'widgets/circle_dot.dart';
import 'widgets/first_sectioon.dart';
import 'widgets/full_card_.dart';
import 'widgets/grid_view_card.dart';
import 'widgets/large_card.dart';
import 'widgets/third_banner.dart';
import 'widgets/vertical_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return Consumer<HomeProvider>(
      builder: (context, value, _) {
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
              child: CircleAvatharTop(
                width: width,
              ),
            ),
            FadeInLeft(
              child: HomeCarouselBanners(
                width: width,
                heights: heights / 1.5,
                list: context.read<HomeProvider>().listBanner[0].images,
              ),
            ),
            FadeInRight(
              child: const DotIndicator(),
            ),
            FadeInDown(
              child: const ThirdBanner(),
            ),
            sizedBox20,
            FadeInLeftBig(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/bg/firstbg.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderWidget(
                        text: '   SHIRTS',
                      ),
                      Consumer<ShirtProvider>(
                        builder: (context, valule, _) {
                          return LargeCardsWidget(
                            width: width,
                            heights: heights,
                            list: valule.shirtMapList,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            sizedBox20,
            FadeInRightBig(
              child: const Padding(
                padding: EdgeInsets.all(
                  8.0,
                ),
                child: TshirtBanner(),
              ),
            ),
            sizedBox20,
            FadeInUp(
              child: ContainerCardGrid(
                heights: heights,
                width: width,
                image: 'assets/bg/tshirtbg.jpg',
                name: 'T-Shirts',
                list: context.read<TshirtProvider>().tShirtList,
              ),
            ),
            FadeInRight(
              child: NotImportant(
                heights: heights,
                width: width,
                list: context.read<JeansProvider>().jeansList,
              ),
            ),
            FadeInDownBig(
              child: VerticalBulder(
                list: context.read<ShoesProvider>().shoesList,
                image: 'assets/bg/shoesbg.jpg',
                width: width,
                height: heights,
              ),
            ),
            sizedBox20,
            FadeInUpBig(
              child: ContainerCardGrid(
                heights: heights,
                width: width,
                image: 'assets/bg/shirtbg.jpg',
                name: 'T-Shirts',
                list: context.read<WatchProvider>().watchList,
              ),
            ),
            sizedBox20,
            FadeInUpBig(
              child: VerticalBulder(
                list: context.read<ShirtProvider>().shirtMapList,
                image: 'assets/bg/shirt2bg.jpg',
                width: width,
                height: heights,
              ),
            ),
            sizedBox50,
            ShopNowButton(
              screen: ProductsScreen(
                list: AppColor.rootScaffoldMessengerKey.currentState!.context
                    .read<ProductsProvider>()
                    .allProducts,
                title: 'ALL PRODUCTS',
              ),
              textButton: 'SHOP ALL PRODUCTS',
            )
          ],
        );
      },
    );
  }
}

class ContainerCardGrid extends StatelessWidget {
  const ContainerCardGrid({
    Key? key,
    required this.heights,
    required this.width,
    required this.image,
    required this.name,
    required this.list,
  }) : super(key: key);

  final double heights;
  final double width;
  final String image;
  final String name;
  final List list;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          HeaderWidget(
            text: name,
          ),
          GridViewCard(
            list: list,
            heights: heights,
            width: width,
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: GoogleFonts.acme().fontFamily,
        ),
      ),
    );
  }
}
