import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/button.dart';
import 'package:menz_cart_app/app/payment/view_model/payment_screen.dart';
import 'package:provider/provider.dart';

class ProductCartCard extends StatelessWidget {
  const ProductCartCard({
    Key? key,
    required this.width,
    required this.name,
    required this.image,
    required this.price,
    required this.id,
  }) : super(key: key);

  final double width;
  final String image, name, price, id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: image,
                width: width / 3,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toUpperCase(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        'Multi color',
                      ),
                      Row(
                        children: [
                          IconStared(
                            width: width,
                            star: 4,
                            color: const Color.fromARGB(255, 22, 91, 24),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '\$ $price',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.kRed,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              TextSpan(
                                text: ' \$ $price',
                                style: TextStyle(
                                  color: AppColor.kGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Deliver in 1 Week',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Free Delivery',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.kGreen,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShopTransparentButton(
                  fn: () {
                    context.read<CartNotifier>().removeCart(context, id);
                  },
                  amount: 125,
                  button: 'Remove ',
                  buttonBgColor: AppColor.kWhite,
                  buttonColor: AppColor.kRed,
                ),
                ShopTransparentButton(
                  fn: () {
                    context.read<PaymentProvider>().openCheckout(
                          int.parse(price),
                          name,
                        );
                  },
                  amount: 125,
                  button: 'Buy this now ',
                  buttonBgColor: AppColor.kWhite,
                  buttonColor: AppColor.kGreen,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconStared extends StatelessWidget {
  const IconStared(
      {Key? key, required this.color, required this.star, required this.width})
      : super(key: key);
  final Color color;
  final double star;
  final double width;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: star,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }
}
