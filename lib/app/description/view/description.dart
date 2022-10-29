import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view/widgets/price_details.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/app/utilities/view/divider_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/bottom.dart';
import 'widgets/delivery.dart';
import 'widgets/profile_card.dart';
import 'widgets/profile_card_image.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {Key? key,
      required this.image,
      required this.amount,
      required this.discout,
      required this.name,
      required this.topcollection,
      required this.price,
      required this.description,
      required this.id,
      required this.brand,
      required this.category,
      required this.colors,
      required this.material,
      required this.offer,
      required this.size
      // required this.star,
      })
      : super(key: key);
  final String image;
  final String amount;
  final String discout;
  final String name, id;

  final String topcollection;
  final String description, category, colors, brand, material;
  final int price, offer, size;
  // final double star;
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
              ProductImageWidget(
                width: width,
                height: height,
                image: image,
              ),
              ProductDetailsCard(
                name: name,
                topcollection: topcollection,
                star: 5,
                price: price.toString(),
                discount: discout.toString(),
              ),
              DividerWidget(
                height: height / 2,
              ),
              const DeliveryAddress(),
              DividerWidget(
                height: height / 2,
              ),
              PriceDetails(
                amount: amount,
                discout: discout,
                height: height,
              ),
              const DividerWidget(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Production Details',
                    ),
                    Text(topcollection),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(
            5.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomTab(
                index: 0,
                width: width,
                name: 'BUY NOW',
                color: AppColor.primary,
                description: description,
                productName: name,
                images: image,
                price: price,
                offer: int.parse(amount),
                id: id,
                material: material,
                brand: brand,
                colors: colors,
                category: category,
                size: size,
              ),
              BottomTab(
                index: 1,
                width: width,
                name: context.watch<LoginProvider>().isLogged
                    ? context.watch<CartProvider>().productCheck(context, id)
                        ? "Remove from cart"
                        : 'Add to cart'
                    : 'Add to cart',
                color: const Color.fromARGB(
                  199,
                  220,
                  199,
                  13,
                ),
                description: description,
                productName: name,
                images: image,
                price: price,
                offer: int.parse(amount),
                id: id,
                material: material,
                brand: brand,
                colors: colors,
                category: category,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
