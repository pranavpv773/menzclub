import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_map.dart';

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

class VerticalBulder extends StatelessWidget {
  const VerticalBulder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'https://i.pinimg.com/736x/24/52/e8/2452e861c7e902c1fc2e184c56807fd6.jpg',
            ),
            fit: BoxFit.fill),
      ),
      width: width,
      height: height / 2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          shoesCollections.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                shadowColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    color: primary1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width / 1.5,
                          height: height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                  shoesCollections[index],
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      Text(shoesMap[index]['color'].toString()),
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
