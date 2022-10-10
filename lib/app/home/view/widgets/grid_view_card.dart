import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/t_shirt/view/t_shirt_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisExtent: heights / 2.3,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.favorite_border,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width / 2.5,
                    height: heights / 4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data[index].images[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data[index].name),
                      ),
                      Text(
                        '${data[index].offer} Off',
                        style: const TextStyle(color: Colors.green),
                      ),
                      const ShopNowButton(
                        screen: TshirtScreen(),
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
