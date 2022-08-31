import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
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
          CircleAvatharTop(
            width: width,
          ),
          HomeCarouselBanners(
            width: width,
            heights: heights / 1.5,
            list: context.read<HomeProvider>().banners,
          ),
          const DotIndicator(),
          const ThirdBanner(),
          sizedBox20,
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.wallpapersafari.com/desktop/1280/1024/87/31/QG0FhB.jpg',
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
                    list: shirts,
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://thumbs.dreamstime.com/b/texture-blue-decorative-plaster-concrete-vignette-abstract-grunge-background-design-234969184.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const HeaderWidget(
                  text: 'T-Shirts',
                ),
                GridViewCard(
                  heights: heights,
                  width: width,
                ),
              ],
            ),
          ),
          NotImportant(
            heights: heights,
            width: width,
          ),
          VerticalBulder(
            width: width,
            height: heights,
          )
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
