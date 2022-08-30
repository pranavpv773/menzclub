import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width / 2,
        height: height / 10,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
          color: kWhite,
          width: 2,
        )),
        child: child);
  }
}
