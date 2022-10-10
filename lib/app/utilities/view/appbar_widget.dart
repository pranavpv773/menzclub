import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class CommonAppBarWidget extends StatelessWidget {
  const CommonAppBarWidget({
    Key? key,
    required this.section,
  }) : super(key: key);
  final String section;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: Text(section),
    );
  }
}
