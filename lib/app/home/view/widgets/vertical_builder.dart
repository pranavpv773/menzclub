import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';

class VerticalBulder extends StatelessWidget {
  const VerticalBulder({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.list,
  }) : super(key: key);
  final double width;
  final double height;
  final List list;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.fill,
        ),
      ),
      width: width,
      height: height / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          6,
          (index) => Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                elevation: 10,
                shadowColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary1,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: Container(
                          width: width / 2,
                          height: height / 2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                list[index].images[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '\u{20B9} ${list[index].price.toString()}',
                        style: AppTextStyles.currency,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
