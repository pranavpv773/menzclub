import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/utilities/view/container_network.dart';

class BudgetBuysJeans extends StatelessWidget {
  const BudgetBuysJeans({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "BUDGET BUYS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: GoogleFonts.abhayaLibre().fontFamily,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BudgetBuysCategories(
                  width: width,
                  height: height,
                  caption: '1500',
                ),
                BudgetBuysCategories(
                  width: width,
                  height: height,
                  caption: '3000',
                ),
                BudgetBuysCategories(
                  width: width,
                  height: height,
                  caption: '5000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BudgetBuysCategories extends StatelessWidget {
  const BudgetBuysCategories({
    Key? key,
    required this.width,
    required this.height,
    required this.caption,
  }) : super(key: key);

  final double width;
  final double height;
  final String caption;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      shadowColor: Colors.black,
      child: Column(
        children: [
          ContainerImageChild(
            width: width / 4,
            height: height / 6,
            image:
                'https://png.pngtree.com/thumb_back/fh260/background/20190222/ourmid/pngtree-creative-jeans-paper-cut-wind-background-cut-wind-backgroundcropfashion-image_56520.jpg',
            widget: Center(
              child: Text(
                caption,
                style: TextStyle(
                  color: AppColor.kWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.abhayaLibre().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
