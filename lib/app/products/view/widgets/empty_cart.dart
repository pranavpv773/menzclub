import 'package:flutter/material.dart';

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
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/lottee/urban-man-with-mobile-phone-is-shopping-in-online-store-shopping-bag-is-in-supermarket-cart (1).png',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Nothing found',
            ),
          ],
        ),
      ),
    );
  }
}
