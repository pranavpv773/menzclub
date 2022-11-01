import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        list[index].images[0],
                      ),
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
