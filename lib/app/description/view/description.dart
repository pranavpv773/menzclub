import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/my_cart/view/widgets/price_details.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';
import 'widgets/bottom.dart';
import 'widgets/delivery.dart';
import 'widgets/profile_card.dart';
import 'widgets/profile_card_image.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.topcollection,
      required this.price,
      required this.star})
      : super(key: key);
  final String image;
  final String name;
  final String topcollection;
  final String price;
  final double star;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            height / 15,
          ),
          child: CommonAppBarWidget(
            section: name,
          ),
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageWidget(width: width, height: height, image: image),
              ProductDetailsCard(
                name: name,
                topcollection: topcollection,
                star: star,
                price: price,
              ),
              DividerWidget(height: height / 2),
              const DeliveryAddress(),
              DividerWidget(height: height / 2),
              PriceDetails(
                height: height,
              ),
              DividerWidget(height: height / 2),
              const Text('Production Details')
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomTab(
                index: 0,
                width: width,
                name: 'BUY NOW',
                color: primary,
              ),
              BottomTab(
                index: 1,
                width: width,
                name: 'Add to cart',
                color: const Color.fromARGB(199, 220, 199, 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
