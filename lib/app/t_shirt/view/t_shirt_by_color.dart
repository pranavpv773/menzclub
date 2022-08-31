import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/shirt/view/widgets/shirt_fit.dart';

import 'widgets/t_shirt_builder.dart';

class TshirtByColor extends StatelessWidget {
  const TshirtByColor({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 1.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/free-vector/realistic-leaves-with-blue-neon-frame_52683-33597.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          ShirtContentBanner(
            color: Colors.black,
            width: width,
            height: height,
            image: 'assets/tshirt/neonshirt.jpg',
            topic: 'SHOP  BY COLOR',
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          TshirtColorBuilder(
            width: width,
            height: height,
          )
        ],
      ),
    );
  }
}
