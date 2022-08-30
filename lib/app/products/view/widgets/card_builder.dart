import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/t_shirt/view/t_shirt_screen.dart';

class ProductCardBuilder extends StatelessWidget {
  const ProductCardBuilder(
      {Key? key, required this.height, required this.list, required this.width})
      : super(key: key);
  final double height;
  final List list;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        mainAxisExtent: height / 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 20,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, index) {
        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            shadowColor: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                color: primary1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                            list[index]['productImage'].toString(),
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                        // color: Color.fromARGB(255, 166, 232, 11),
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index]['productName'].toString(),
                              ),
                              const Icon(Icons.favorite_border_outlined)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$ ${list[index]['productPrice'].toString()}',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                              const Text(
                                '60-80% Off',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        const ShopNowButton(
                          screen: TshirtScreen(),
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
