import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/home/view_model/shirts.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    Key? key,
    required this.heights,
    required this.width,
  }) : super(key: key);

  final double heights;
  final double width;

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
          itemCount: tShirts.length,
          itemBuilder: (BuildContext ctx, index) {
            return Material(
              elevation: 10,
              shadowColor: Colors.black,
              child: Container(
                color: kWhite,
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
                          image: NetworkImage(tShirts[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Product Name'),
                        ),
                        const Text(
                          '60-80% Off',
                          style: const TextStyle(color: Colors.green),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(primary),
                          ),
                          onPressed: () {},
                          child: Text(
                            'SHOP NOW',
                            style: TextStyle(color: kWhite),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
