import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class SortBySize extends StatelessWidget {
  const SortBySize({
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
                image: AssetImage('assets/banners/shirt2.jpeg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "SELECT BY SIZE",
                style: TextStyle(
                    color: AppColor.kWhite,
                    fontSize: 30,
                    fontFamily: GoogleFonts.abel().fontFamily),
              ),
              Image.asset(
                'assets/shoes/shoes_gif.gif',
                width: width,
                height: height / 5,
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
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        await context.read<ShoesProvider>().fetchShirtSize(
                              index + 6,
                            );
                        RoutesProvider.nextScreen(
                            screen: ProductsScreen(
                          title: 'UK${index + 6}',
                          // ignore: use_build_context_synchronously
                          list: context.read<ShoesProvider>().shoesSizeList,
                        ));
                      },
                      child: Column(
                        children: [
                          Container(
                            color: AppColor.kWhite,
                            child: Container(
                              width: width / 3,
                              height: height / 15,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRFw7k2JngskIKJ0jfZlHCq0uWjvvXFLFkEZaMLVm9SKN9zr2IFWEXAnEThXmJ9-25ZrM&usqp=CAU',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'UK${6 + index}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.aBeeZee().fontFamily),
                                ),
                              ),
                            ),
                          ),
                        ],
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
