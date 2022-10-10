import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required this.height,
    this.indent,
    this.lastIndent,
  }) : super(key: key);

  final double height;
  final double? indent;
  final double? lastIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.kGrey,
      thickness: height / 100,
      indent: indent ?? 0,
      endIndent: lastIndent ?? 0,
    );
  }
}
