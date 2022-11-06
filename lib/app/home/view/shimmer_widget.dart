import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300] as Color,
            highlightColor: Colors.grey[100] as Color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: width,
                  height: 80,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                        9,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColor.kWhite,
                              ),
                            )),
                  ),
                ),
                ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
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
                        ]),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
