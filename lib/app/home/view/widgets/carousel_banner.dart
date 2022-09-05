import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class HomeCarouselBanners extends StatelessWidget {
  const HomeCarouselBanners(
      {Key? key,
      required this.width,
      required this.heights,
      required this.list})
      : super(key: key);

  final double width;
  final double heights;
  final List list;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      return CarouselSlider.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index, int itemIndex) {
          return Container(
            width: width / 1,
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  list[index],
                ),
                fit: BoxFit.cover,
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
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
      );
    });
  }
}

class CarouselBannerCard extends StatelessWidget {
  const CarouselBannerCard({Key? key, required this.width, required this.list})
      : super(key: key);
  final List list;

  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, _) {
      return Container(
        width: width / 1,
        margin: const EdgeInsets.all(6.0),
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
