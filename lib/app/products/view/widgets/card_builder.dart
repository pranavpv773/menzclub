import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/description/view/description.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menz_cart_app/app/products/view/widgets/empty_cart.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider_two.dart';
import 'package:provider/provider.dart';

import 'smimmer_card.dart';

class ProductCardBuilder extends StatelessWidget {
  const ProductCardBuilder({
    Key? key,
    required this.height,
    required this.width,
    required this.lists,
  }) : super(key: key);
  final double height;
  final double width;
  final List lists;
  @override
  Widget build(BuildContext context) {
    return context.watch<ShirtProviderTwo>().fetchBool == true
        ? ShimmerCardBuilder(height: height)
        : lists.isEmpty
            ? EmptyCart(width: width, height: height)
            : GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  mainAxisExtent: height / 1.9,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                ),
                itemCount: lists.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: width,
                              height: height / 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    lists[index].images[0].toString(),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              decoration: const BoxDecoration(
                                  // color: Color.fromARGB(255, 166, 232, 11),
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                      8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            lists[index]
                                                .name
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                    .read<LoginProvider>()
                                                    .isLogged
                                                ? context
                                                    .read<CartProvider>()
                                                    .addToCart(
                                                      context,
                                                      lists[index].name,
                                                      lists[index]
                                                          .description
                                                          .toString(),
                                                      lists[index]
                                                          .images[0]
                                                          .toString(),
                                                      lists[index].price,
                                                      lists[index].offer,
                                                      lists[index].id,
                                                      lists[index]
                                                          .category
                                                          .toString(),
                                                      lists[index]
                                                          .color
                                                          .toString(),
                                                      lists[index]
                                                          .brand
                                                          .toString(),
                                                      lists[index].size,
                                                      lists[index]
                                                          .material
                                                          .toString(),
                                                    )
                                                : Fluttertoast.showToast(
                                                    msg:
                                                        "Please login to add product to cart",
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\u{20B9} ${lists[index].price.toString()}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Text(
                                          '${lists[index].offer.toString()}% Off',
                                          style: const TextStyle(
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ShopNowButton(
                                    screen: DescriptionScreen(
                                      brand: lists[index].brand.toString(),
                                      offer: lists[index].offer,
                                      material:
                                          lists[index].material.toString(),
                                      colors: lists[index].color.toString(),
                                      size: lists[index].size,
                                      category:
                                          lists[index].category.toString(),
                                      id: lists[index].id.toString(),
                                      amount: lists[index].price.toString(),
                                      discout: lists[index].offer.toString(),
                                      description:
                                          lists[index].description.toString(),
                                      price: lists[index].price,
                                      topcollection:
                                          lists[index].description.toString(),
                                      image: lists[index].images[0].toString(),
                                      name: lists[index].name.toString(),
                                    ),
                                    textButton: 'SHOP NOW',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }
}
