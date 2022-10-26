import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class MyWishListScreen extends StatelessWidget {
  const MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text(
          'Wishlist',
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'assets/lottee/wishlistbg.jpg',
            ),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              AppColor.primary.withOpacity(0.36),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your wishlist is empty',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.aBeeZee().fontFamily,
              ),
            ),
            Text(
              'Save items that you like in your wishlist',
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
                        list: context.read<ProductsProvider>().allProducts));
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
      ),
    );
  }
}
