import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';

class JeansGrabOffers extends StatelessWidget {
  const JeansGrabOffers({
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
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://png.pngtree.com/thumb_back/fh260/back_our/20200817/ourmid/pngtree-blue-denim-texture-picture-png-image_394464.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Grab by Offers",
                style: TextStyle(
                    color: AppColor.kWhite,
                    fontSize: 30,
                    fontFamily: GoogleFonts.abel().fontFamily),
              ),
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
                      shadowColor: const Color.fromARGB(255, 33, 150, 243),
                      child: Container(
                        color: AppColor.kWhite,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                width: width / 2.5,
                                height: height / 4,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://previews.123rf.com/images/pixxart/pixxart1207/pixxart120700078/14388392-jeans-frame.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${offerList[index]}% OFF',
                                    style: TextStyle(
                                        color: AppColor.kWhite,
                                        fontSize: 30,
                                        fontFamily:
                                            GoogleFonts.abel().fontFamily),
                                  ),
                                ),
                              ),
                              // Text(
                              //   shirtList[index]['topcollection'].toString(),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
