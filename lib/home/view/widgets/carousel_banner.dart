import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeCarouselBanners extends StatelessWidget {
  const HomeCarouselBanners({
    Key? key,
    required this.width,
    required this.heights,
  }) : super(key: key);

  final double width;
  final double heights;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      return CarouselSlider.builder(
        itemCount: context.read<HomeProvider>().banners.length,
        itemBuilder: (BuildContext context, int index, int itemIndex) {
          print(index);
          return Container(
            width: width / 1,
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  value.banners[index],
                ),
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: heights / 2,
          enlargeCenterPage: false,
          autoPlay: true,
          // aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
      );
    });
  }
}

class CarouselBannerCard extends StatelessWidget {
  const CarouselBannerCard({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      return Container(
        width: width / 1,
        margin: EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
              value.banners[4],
            ),
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}
