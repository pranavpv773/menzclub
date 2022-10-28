import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'widgets/products_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: context.watch<LoginProvider>().isLogged
          ? LoginCartScreen(
              width: width,
              height: height,
            )
          : SizedBox(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/lottee/login.png",
                  ),
                  const TextStyleWidget(
                    text: "Please Login and add products to cart",
                  ),
                ],
              ),
            ),
    );
  }
}

class LoginCartScreen extends StatelessWidget {
  const LoginCartScreen({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Consumer<CartNotifier>(builder: (context, val, _) {
        return context.watch<CartNotifier>().cartList.isEmpty
            ? SizedBox(
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/lottee/cart_empty.png',
                      width: width / 2,
                      height: height / 5,
                    ),
                    Text(
                      'Your Cart is empty',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      ),
                    ),
                    Text(
                      'Save items that you like in your Cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                        fontFamily: GoogleFonts.actor().fontFamily,
                      ),
                    ),
                    Text(
                      'Review them anytime and easily order them',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                        fontFamily: GoogleFonts.actor().fontFamily,
                      ),
                    ),
                    ShopTransparentButton(
                      fn: () {
                        RoutesProvider.nextScreen(
                          screen: ProductsScreen(
                            title: "All Products",
                            list: context.read<ProductsProvider>().allProducts,
                          ),
                        );
                      },
                      amount: 125,
                      button: 'SHOP NOW',
                      buttonBgColor: Colors.transparent.withOpacity(
                        0.1,
                      ),
                      buttonColor: AppColor.primary,
                    )
                  ],
                ),
              )
            : CartCardList(width: width, height: height);
      }),
    );
  }
}

class CartCardList extends StatelessWidget {
  const CartCardList({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: context.read<CartNotifier>().cartList.length,
            itemBuilder: (context, index) {
              final data = context.read<CartNotifier>().cartList;
              return Column(
                children: [
                  ProductCartCard(
                    id: data[index].id.toString(),
                    price: data[index].userCart[0].productPrice.toString(),
                    name: data[index].userCart[0].productName,
                    image: data[index].userCart[0].images[0],
                    width: width,
                  ),
                  DividerWidget(
                    height: height,
                  ),
                  sizedBox50,
                ],
              );
            }),
        const ShopNowButton(
          textButton: 'Place Order',
          screen: OrderSummary(),
        )
      ],
    );
  }
}

class TextStyleWidget extends StatelessWidget {
  const TextStyleWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
