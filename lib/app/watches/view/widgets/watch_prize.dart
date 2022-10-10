import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
              color: AppColor.kWhite,
              fontSize: 20,
              fontFamily: GoogleFonts.notoSerif().fontFamily,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  await context.read<WatchProvider>().fetchWatchPrice(
                        1500,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${1500}',
                    // ignore: use_build_context_synchronously
                    list: context.read<WatchProvider>().watchPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  height: height,
                  width: width,
                  offer: '1500',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await context.read<WatchProvider>().fetchWatchPrice(
                        3000,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${3000}',
                    // ignore: use_build_context_synchronously
                    list: context.read<WatchProvider>().watchPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  width: width,
                  height: height,
                  offer: '3000',
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await context.read<WatchProvider>().fetchWatchPrice(
                        5000,
                      );
                  RoutesProvider.nextScreen(
                      screen: ProductsScreen(
                    title: 'Offer Under${5000}',
                    // ignore: use_build_context_synchronously
                    list: context.read<WatchProvider>().watchPriceList,
                  ));
                },
                child: CircleAvatharOffer(
                  width: width,
                  height: height,
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
              style: TextStyle(color: AppColor.kWhite),
            ),
            Text(
              offer,
              style: TextStyle(
                color: AppColor.kWhite,
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
