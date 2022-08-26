import 'package:flutter/material.dart';
import 'package:menz_cart_app/categories/view_model/map.dart';
import 'package:menz_cart_app/constants/colors.dart';

class CircleAvatharTop extends StatelessWidget {
  const CircleAvatharTop({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            categoryList.length,
            (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 30,
                        backgroundImage: NetworkImage(
                          categoryList[index]['circleAvatharImg'].toString(),
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
                )),
      ),
    );
  }
}
