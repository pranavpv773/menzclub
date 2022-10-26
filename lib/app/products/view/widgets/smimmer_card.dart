import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerCardBuilder extends StatelessWidget {
  const ShimmerCardBuilder({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisExtent: height / 3,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 20,
      ),
      itemCount: 15,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer(
            direction: const ShimmerDirection.fromRightToLeft(),
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
