import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TShirtContentBanner extends StatelessWidget {
  const TShirtContentBanner({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.topic,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
  }) : super(key: key);

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
      height: height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth),
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
                  fontSize: 22, fontFamily: GoogleFonts.amarante().fontFamily),
            )
          ],
        ),
      ),
    );
  }
}
