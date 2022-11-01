import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

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
        margin: const EdgeInsets.all(
          6.0,
        ),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              value.listBanner[0].images[1].toString(),
            ),
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}
