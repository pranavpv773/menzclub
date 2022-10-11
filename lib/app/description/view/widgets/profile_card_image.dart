import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: width / 1,
        height: height / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
