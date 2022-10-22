import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/categories/view_model/map.dart';
import 'package:menz_cart_app/app/utilities/view_model/service_utility.dart';
import 'package:provider/provider.dart';

class CircleAvatharTop extends StatelessWidget {
  const CircleAvatharTop({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 100,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          categoryList.length,
          (index) => InkWell(
            onTap: () {
              context.read<ServicesProvider>().selectedItem(context, index);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: const AssetImage(
                      'assets/round_frame2.png',
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColor.kWhite,
                      radius: 25,
                      backgroundImage: CachedNetworkImageProvider(
                        categoryList[index]['circleAvatharImg'].toString(),
                      ),
                    ),
                  ),
                ),
                Text(
                  categoryList[index]['categary'].toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
