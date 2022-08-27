import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/utilities/view/container_network.dart';

class ShirtCategoryCards extends StatelessWidget {
  const ShirtCategoryCards({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://getketchadmin.getketch.com/product/8905040617459/660/HLSH011581_1.JPG',
          caption: 'CASUAL',
        ),
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://5.imimg.com/data5/IN/BF/MY-5837050/men-formal-shirt-1000x1000.jpg',
          caption: 'FORMAL',
        ),
        ShirtCategories(
          width: width,
          height: height,
          image:
              'https://rukminim1.flixcart.com/image/612/612/kpodocw0/shirt/s/q/u/l-ronit-ap001-pushya-original-imag3uwarrta9bdy.jpeg?q=70',
          caption: 'PARTY',
        ),
      ],
    );
  }
}

class ShirtCategories extends StatelessWidget {
  const ShirtCategories({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.caption,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerImage(
          width: width,
          height: height,
          image: image,
        ),
        Text(
          caption,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.abhayaLibre().fontFamily,
          ),
        )
      ],
    );
  }
}
