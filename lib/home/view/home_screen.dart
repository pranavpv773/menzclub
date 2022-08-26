import 'package:flutter/material.dart';
import 'package:menz_cart_app/categories/view_model/map.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'widgets/carousel_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CircleAvatharTop(
            width: width,
          ),
          HomeCarouselBanners(width: width, heights: heights),
          const DotIndicator(),
          Container(
            width: 500,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://scontent-bom1-1.xx.fbcdn.net/v/t1.6435-9/39132368_10156660247218221_880685569485570048_n.jpg?stp=dst-jpg_p180x540&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=a5Do2QIJHMkAX99Q7QM&_nc_ht=scontent-bom1-1.xx&oh=00_AT-EO-AeNI4u_HUZ5oQpZixb77JweMnlkX1mM9TG-menbQ&oe=632C7FEE',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleDots(),
          CircleDots(),
          CircleDots(),
          CircleDots(),
          CircleDots(),
        ],
      ),
    );
  }
}

class CircleDots extends StatelessWidget {
  const CircleDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: primary,
      ),
    );
  }
}

class CircleAvatharTop extends StatelessWidget {
  const CircleAvatharTop({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            categoryList.length,
            (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 30,
                        backgroundImage: NetworkImage(
                          categoryList[index]['circleAvatharImg'].toString(),
                        ),
                      ),
                    ),
                    Text(
                      categoryList[index]['categary'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )),
      ),
    );
  }
}
