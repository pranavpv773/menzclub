import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';

class MyWishListScreen extends StatelessWidget {
  const MyWishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text('Wishlist'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lottee/wishlistbg.jpg'),
            fit: BoxFit.fill,
            colorFilter:
                ColorFilter.mode(primary.withOpacity(0.36), BlendMode.dstATop),
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
            const ShopTransparentButton(button: 'SHOP NOW')
          ],
        ),
      ),
    );
  }
}
