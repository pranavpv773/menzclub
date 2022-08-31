import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class BottomTab extends StatelessWidget {
  const BottomTab({
    Key? key,
    required this.width,
    required this.color,
    required this.name,
  }) : super(key: key);

  final double width;
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 2.1,
      color: color,
      child: TextButton(
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: kBlack, fontSize: 20),
        ),
      ),
    );
  }
}
