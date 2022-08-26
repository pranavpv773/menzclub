import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/categories/view_model/map.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/home/view_model/shirts.dart';
import 'widgets/carousel_banner.dart';
import 'widgets/circle_dot.dart';
import 'widgets/first_sectioon.dart';
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
          CircleAvatharTop(width: width),
          HomeCarouselBanners(width: width, heights: heights),
          const DotIndicator(),
          const ThirdBanner(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'SHIRTS',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.acme().fontFamily),
            ),
          ),
          LargeCardsWidget(
            width: width,
            heights: heights,
            list: shirts,
          ),
          TshirtBanner(),
        ],
      ),
    );
  }
}

class LargeCardsWidget extends StatelessWidget {
  const LargeCardsWidget({
    Key? key,
    required this.width,
    required this.heights,
    required this.list,
  }) : super(key: key);

  final double width;
  final double heights;
  final List list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heights / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          list.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  width: width / 1.5,
                  height: heights / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(list[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
