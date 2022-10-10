import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/widgets.dart';
import 'package:menz_cart_app/app/home/view_model/shirts.dart';

class TshirtofferCard extends StatelessWidget {
  const TshirtofferCard({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://thumbs.dreamstime.com/b/brick-walls-neon-light-background-rays-glow-211376300.jpg'),
            fit: BoxFit.fitHeight),
      ),
      child: SizedBox(
        width: width,
        height: height / 1.8,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            tShirts.length,
            (index) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
              child: Column(
                children: [
                  Container(
                    width: width / 1.5,
                    height: height / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(tShirts[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: width,
                          height: height / 20,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              'Upto ${offerList[index]}%',
                              style: TextStyle(color: AppColor.kWhite),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
