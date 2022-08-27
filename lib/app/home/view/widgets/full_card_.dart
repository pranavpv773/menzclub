import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';

class NotImportant extends StatelessWidget {
  const NotImportant({
    Key? key,
    required this.width,
    required this.heights,
  }) : super(key: key);
  final double width;

  final double heights;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Column(
          children: [
            const Center(
              child: Text(
                'IN THE SPOTLIIGHT',
              ),
            ),
            const Center(
              child: Text(
                "Grab 'em before they are gone",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: heights,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              shirts[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          width: width,
                          height: 80,
                          color: primary,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
