import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/description/view/description.dart';
import 'package:menz_cart_app/app/home/view/widgets/grid_view_card.dart';
import 'package:menz_cart_app/app/t_shirt/view/t_shirt_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:menz_cart_app/services/view_model/http_services.dart';
import 'package:provider/provider.dart';

class ProductCardBuilder extends StatelessWidget {
  const ProductCardBuilder(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HttpServicere>(context, listen: false).fetchProducts();
    });
    return Consumer<HttpServicere>(builder: (context, value, _) {
      return value.finalList.isEmpty
          ? Center(
              child: Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/get_started/man_runnig.gif'),
                  ),
                ),
              ),
            )
          : GridView.builder(
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
              itemCount: value.finalList.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    RoutesProvider.nextScreen(
                      screen: DescriptionScreen(
                        star: value.finalList[index].rating!.rate!.toDouble(),
                        price: value.finalList[index].price.toString(),
                        topcollection:
                            value.finalList[index].description.toString(),
                        image: value.finalList[index].image.toString(),
                        name: value.finalList[index].title.toString(),
                      ),
                    );
                  },
                  child: Padding(
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
                                      value.finalList[index].image.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              decoration: const BoxDecoration(
                                  // color: Color.fromARGB(255, 166, 232, 11),
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            value.finalList[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                        const Icon(
                                            Icons.favorite_border_outlined)
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$ ${value.finalList[index].price.toString()}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.green),
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
                  ),
                );
              },
            );
    });
  }
}
