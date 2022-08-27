import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';

class ShirtMaterialWidget extends StatelessWidget {
  const ShirtMaterialWidget({Key? key, required this.height}) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                'https://thumbs.dreamstime.com/b/texture-blue-decorative-plaster-concrete-vignette-abstract-grunge-background-design-234969184.jpg',
              ),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "SHOP BY Material".toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                color: kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 12,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            shirtList[index]['material'].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          shirtList[index]['materialname'].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
