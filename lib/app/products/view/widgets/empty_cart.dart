import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.values[0],
          children: [
            FittedBox(
              child: Image.asset(
                  'assets/lottee/urban-man-with-mobile-phone-is-shopping-in-online-store-shopping-bag-is-in-supermarket-cart (1).png'),
            ),
            Text(
              'Nothing found',
              style: AppTextStyles.h1
                  .copyWith(color: AppColor.primary, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
