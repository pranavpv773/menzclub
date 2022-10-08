import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:animate_do/animate_do.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              list: context.read<HomeProvider>().banners,
            ),
          ),
          FadeInRight(child: const DotIndicator()),
          FadeInDown(child: const ThirdBanner()),
          sizedBox20,
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://png.pngtree.com/thumb_back/fh260/background/20190221/ourmid/pngtree-new-force-week-blue-gradient-geometric-new-in-autumn-image_14190.jpg',
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
                  LargeCardsWidget(
                    width: width,
                    heights: heights,
                    list: context.read<ShirtProvider>().shirtMapList,
                  ),
                ],
              ),
            ),
          ),
          sizedBox20,
          const Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: TshirtBanner(),
          ),
          sizedBox20,
          ContainerCardGrid(
            heights: heights,
            width: width,
            image:
                'https://thumbs.dreamstime.com/b/texture-blue-decorative-plaster-concrete-vignette-abstract-grunge-background-design-234969184.jpg',
            name: 'T-Shirts',
            list: context.read<TshirtProvider>().tShirtList,
          ),
          NotImportant(
            heights: heights,
            width: width,
          ),
          VerticalBulder(
            list: context.read<ShoesProvider>().shoesList,
            image:
                'https://i.pinimg.com/736x/24/52/e8/2452e861c7e902c1fc2e184c56807fd6.jpg',
            width: width,
            height: heights,
          ),
          sizedBox20,
          ContainerCardGrid(
            heights: heights,
            width: width,
            image:
                'https://st4.depositphotos.com/3503231/22048/v/450/depositphotos_220485076-stock-illustration-blue-square-grid-mosaic-background.jpg',
            name: 'T-Shirts',
            list: context.read<WatchProvider>().watchList,
          ),
          sizedBox20,
          VerticalBulder(
            list: context.read<ShirtProvider>().shirtMapList,
            image:
                'https://static.vecteezy.com/system/resources/previews/000/627/162/non_2x/vector-red-square-grid-mosaic-background-creative-design-templates.jpg',
            width: width,
            height: heights,
          ),
        ],
      ),
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
          image: NetworkImage(
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
