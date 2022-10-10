import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleDots(),
          CircleDots(),
          CircleDots(),
          CircleDots(),
          CircleDots(),
        ],
      ),
    );
  }
}

class CircleDots extends StatelessWidget {
  const CircleDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        color: AppColor.primary,
      ),
    );
  }
}
