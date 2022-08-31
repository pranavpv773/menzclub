import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_map.dart';

class WatchColorBuilder extends StatelessWidget {
  const WatchColorBuilder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: height / 5,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                color: primary1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width / 2,
                      height: height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(
                            watchMap[index]['WatchcolorImage'].toString(),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(watchMap[index]['color'].toString()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
