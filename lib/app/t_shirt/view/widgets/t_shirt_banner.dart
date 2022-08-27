import 'package:flutter/material.dart';

class TshirtBannerWidget extends StatelessWidget {
  const TshirtBannerWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 4,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://static.videezy.com/system/resources/thumbnails/000/053/360/original/F070_01.jpg'),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height / 3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://blog.apparelnbags.com/wp-content/uploads/featured-tshirt-banner.jpg'),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
