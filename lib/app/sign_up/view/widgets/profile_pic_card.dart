import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class AvatharCard extends StatelessWidget {
  const AvatharCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.primary,
          height: 200,
        ),
        Container(
          height: 100,
          color: AppColor.primary1,
        ),
        Positioned(
          bottom: 40,
          left: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLlUIlrkWrEKWhugFbim3s8h33j9Uk4hdRbkHI2TEn7ueop1DQ9yEoiW9vz4_jtJc786A&usqp=CAU',
              width: 120,
            ),
          ),
        ),
      ],
    );
  }
}
