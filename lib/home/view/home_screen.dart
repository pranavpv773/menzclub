import 'package:flutter/material.dart';
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
        children: [
          CircleAvatharTop(width: width),
          HomeCarouselBanners(width: width, heights: heights),
          const DotIndicator(),
          const ThirdBanner()
        ],
      ),
    );
  }
}
