import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/utilities/view/container_network.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_map.dart';

class OcassionOddWidget extends StatelessWidget {
  const OcassionOddWidget({
    Key? key,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);
  final int index;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerImage(
          width: width,
          height: height,
          image: watchMap[index]['collectionImage'].toString(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 5),
          child: Container(
            width: width / 1.5,
            color: AppColor.kWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  watchMap[index]['categary'].toString(),
                  style: const TextStyle(
                    wordSpacing: 5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  watchMap[index]['occasion'].toString(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class OcassionEvenWidget extends StatelessWidget {
  const OcassionEvenWidget({
    Key? key,
    required this.index,
    required this.height,
    required this.width,
  }) : super(key: key);
  final int index;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
            bottom: 18,
            left: 15,
            right: 3,
          ),
          child: Container(
            width: width / 1.5,
            color: AppColor.kWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  watchMap[index]['categary'].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  watchMap[index]['occasion'].toString(),
                )
              ],
            ),
          ),
        ),
        ContainerImage(
          width: width,
          height: height,
          image: watchMap[index]['collectionImage'].toString(),
        ),
      ],
    );
  }
}
