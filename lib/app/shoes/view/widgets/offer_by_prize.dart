import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class OfferByPrize extends StatelessWidget {
  const OfferByPrize({
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
      color: const Color.fromARGB(255, 200, 234, 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "OFFER BY PRIZE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: GoogleFonts.notoSerif().fontFamily,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatharOffer(
                width: width,
                offer: '1500',
              ),
              CircleAvatharOffer(
                width: width,
                offer: '3000',
              ),
              CircleAvatharOffer(
                width: width,
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
    required this.offer,
  }) : super(key: key);

  final double width;
  final String offer;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: width / 6.6,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        minRadius: width / 7,
        backgroundColor: kWhite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "UNDER",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                offer,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
