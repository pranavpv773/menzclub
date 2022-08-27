import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';

class TopCollectionsWidget extends StatelessWidget {
  const TopCollectionsWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const Text("TOP COLLECTIONS"),
          GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: height / 3.5,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext ctx, index) {
                return Material(
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Container(
                    color: kWhite,
                    child: Column(
                      children: [
                        Container(
                          width: width / 2.5,
                          height: height / 4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                shirts[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          shirtList[index]['topcollection'].toString(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
