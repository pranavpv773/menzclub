import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width / 1,
                height: height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(topcollection),
                    RatingBarIndicator(
                      rating: star,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '\$8.99',
                              style: TextStyle(
                                fontSize: 16,
                                color: kRed,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' \$ $price',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Deliver in 2 Days,Fri',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Free Delivery',
                      style: TextStyle(fontSize: 16, color: kGreen),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
