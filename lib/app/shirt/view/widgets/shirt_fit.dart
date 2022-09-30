import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';

class ShirtFitWidget extends StatelessWidget {
  const ShirtFitWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.image2,
      required this.color,
      required this.topic,
      required this.crossAxisAlignment,
      required this.mainAxisAlignment})
      : super(key: key);
  final double width;
  final double height;
  final String image;
  final String image2;
  final String topic;

  final Color color;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShirtContentBanner(
          color: color,
          width: width,
          height: height,
          image: image,
          topic: topic,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
        ),
        GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: height / 8,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    // RoutesProvider.nextScreen(
                    //   screen: ProductsScreen(
                    //       endPoints: ApiEndPoints.getShirts,
                    //       title: shirtList[index]['fit'].toString(),
                    //       list: shirtList),
                    // );
                  },
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Container(
                      width: width / 2.5,
                      height: height / 8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            image2,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        shirtList[index]['fit'].toString(),
                        style: TextStyle(
                          color: kWhite,
                        ),
                      )),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class ShirtContentBanner extends StatelessWidget {
  const ShirtContentBanner({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.image,
    required this.topic,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
  }) : super(key: key);
  final Color color;
  final double width;
  final double height;
  final String image;
  final String topic;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Text(
              topic,
              style: TextStyle(
                fontSize: 22,
                fontFamily: GoogleFonts.amarante().fontFamily,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShirtBannerBuilder extends StatelessWidget {
  const ShirtBannerBuilder({
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
        maxCrossAxisExtent: 150,
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
          child: GestureDetector(
            onTap: () {
              // RoutesProvider.nextScreen(
              //     screen: ProductsScreen(
              //         endPoints: ApiEndPoints.getShirts,
              //         title: shirtList[index]['color'].toString(),
              //         list: shirtList));
            },
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
                        width: width / 5,
                        height: height / 8,
                        decoration: BoxDecoration(
                          color: colorList[index],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Text(shirtList[index]['color'].toString()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
