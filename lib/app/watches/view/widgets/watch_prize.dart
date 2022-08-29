import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class WatchShopByPrize extends StatelessWidget {
  const WatchShopByPrize({
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
      height: height / 4,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "OFFER BY PRIZE",
            style: TextStyle(
              color: kWhite,
              fontSize: 20,
              fontFamily: GoogleFonts.notoSerif().fontFamily,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatharOffer(
                height: height,
                width: width,
                offer: '1500',
              ),
              CircleAvatharOffer(
                width: width,
                height: height,
                offer: '3000',
              ),
              CircleAvatharOffer(
                width: width,
                height: height,
                offer: '5000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleAvatharOffer extends StatelessWidget {
  const CircleAvatharOffer({
    Key? key,
    required this.width,
    required this.height,
    required this.offer,
  }) : super(key: key);

  final double width;
  final double height;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width / 4,
        height: height / 5,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/watches/watch_frame.png'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "UNDER",
              style: TextStyle(color: kWhite),
            ),
            Text(
              offer,
              style: TextStyle(
                color: kWhite,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
