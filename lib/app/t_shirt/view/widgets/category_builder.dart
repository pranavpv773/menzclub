// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt_provider_two.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class TshirtCategoryBuilderWidget extends StatelessWidget {
  const TshirtCategoryBuilderWidget({
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
        mainAxisExtent: height / 6,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 1,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () async {
            await context.read<TshirtProviderTwo>().fetchShirtCategory(
                  tShirtList[index]['categary'].toString(),
                );
            RoutesProvider.nextScreen(
                screen: ProductsScreen(
              title: tShirtList[index]['categary'].toString(),
              list: context.read<TshirtProviderTwo>().tShirtCategory,
            ));
          },
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  // color: primary,
                  image: DecorationImage(
                      image: AssetImage('assets/frames/neon2.png'),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    width: width / 4.5,
                    height: height / 9,
                    decoration: const BoxDecoration(
                        // color: Color.fromARGB(101, 158, 158, 158),
                        ),
                    child: Image.asset(
                      tShirtList[index]['categoryImage'].toString(),
                      width: width / 3,
                      height: height / 8,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  tShirtList[index]['categary'].toString(),
                  style: TextStyle(
                      fontSize: 15, fontFamily: GoogleFonts.benne().fontFamily),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class TshirtCategoryWidget extends StatelessWidget {
  const TshirtCategoryWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GradientText(
          text,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.alumniSans().fontFamily),
          colors: [
            AppColor.primary,
            const Color.fromARGB(255, 236, 29, 255),
            const Color.fromARGB(255, 146, 8, 174),
          ],
        ),
      ),
    );
  }
}
