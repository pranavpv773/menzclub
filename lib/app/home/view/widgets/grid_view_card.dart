// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/description/view/description.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    Key? key,
    required this.heights,
    required this.width,
    required this.list,
  }) : super(key: key);

  final double heights;
  final double width;
  final List list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: heights / 2.3,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext ctx, index) {
          final data = list;
          return Material(
            elevation: 10,
            shadowColor: Colors.black,
            child: Container(
              color: AppColor.kWhite,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<LoginProvider>().isLogged
                                ? context.read<CartProvider>().addToCart(
                                      context,
                                      list[index].name,
                                      list[index].description.toString(),
                                      list[index].images[0].toString(),
                                      list[index].price,
                                      list[index].offer,
                                      list[index].id,
                                      list[index].category.toString(),
                                      list[index].color.toString(),
                                      list[index].brand.toString(),
                                      list[index].size,
                                      list[index].material.toString(),
                                    )
                                : Fluttertoast.showToast(
                                    msg: "Please login to add product to cart",
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                          },
                          child: Image.asset(
                            "assets/lottee/add-to-cart.png",
                            width: 50,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2.5,
                    height: heights / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          data[index].images[0],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].name,
                        ),
                      ),
                      Text(
                        '${data[index].offer}% Off',
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                      ShopNowButton(
                        screen: DescriptionScreen(
                          category: data[index].category.toString(),
                          colors: data[index].color.toString(),
                          size: data[index].size,
                          offer: data[index].offer,
                          brand: data[index].brand,
                          material: data[index].category,
                          id: data[index].id.toString(),
                          amount: data[index].price.toString(),
                          discout: data[index].offer.toString(),
                          price: data[index].price,
                          topcollection: data[index].description.toString(),
                          image: data[index].images[0].toString(),
                          name: data[index].name.toString(),
                          description: data[index].description.toString(),
                        ),
                        textButton: 'SHOP NOW',
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShopNowButton extends StatelessWidget {
  const ShopNowButton({
    Key? key,
    required this.screen,
    required this.textButton,
  }) : super(key: key);
  final String textButton;
  final dynamic screen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.primary),
          ),
          onPressed: () {
            RoutesProvider.nextScreen(screen: screen);
          },
          child: Text(
            textButton,
            style: TextStyle(color: AppColor.kWhite),
          ),
        ),
      ),
    );
  }
}
