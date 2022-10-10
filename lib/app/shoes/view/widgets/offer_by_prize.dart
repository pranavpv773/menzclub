import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
              GestureDetector(
                onTap: () async {
                  await context.read<ShoesProvider>().fetchShirtOffer(
                        1500,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${1500}',
                    // ignore: use_build_context_synchronously
                    list: context.read<ShoesProvider>().shoesPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  width: width,
                  offer: '1500',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await context.read<ShoesProvider>().fetchShirtOffer(
                        3000,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${3000}',
                    // ignore: use_build_context_synchronously
                    list: context.read<ShoesProvider>().shoesPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  width: width,
                  offer: '3000',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await context.read<ShoesProvider>().fetchShirtOffer(
                        5000,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${5000}',
                    // ignore: use_build_context_synchronously
                    list: context.read<ShoesProvider>().shoesPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  width: width,
                  offer: '5000',
                ),
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
        backgroundColor: AppColor.kWhite,
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
