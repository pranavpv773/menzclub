import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategories extends StatelessWidget {
  const ShimmerCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    log("message");
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
          baseColor: Colors.grey[200] as Color,
          highlightColor: Colors.grey[50] as Color,
          child: ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        color: Colors.white,
                      ),
                      // Container(
                      //   width: 10,
                      //   height: 10.0,
                      //   color: Colors.white,
                      // ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
