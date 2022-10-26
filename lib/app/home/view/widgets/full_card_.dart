import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NotImportant extends StatelessWidget {
  const NotImportant({
    Key? key,
    required this.width,
    required this.heights,
    required this.list,
  }) : super(key: key);
  final double width;
  final List list;
  final double heights;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      // ignore: avoid_unnecessary_containers
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrJYjSx9X2GB_j2Xy1sXrlkLRGZZFepIONMCh0Qa_U-LDbNmsJA3pCfP8Lo3PJ0UZBd0o&usqp=CAU',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                'IN THE SPOTLIIGHT',
              ),
            ),
            const Center(
              child: Text(
                "Grab 'em before they are gone",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return list.isEmpty
                    ? SizedBox(
                        width: 200.0,
                        height: 100.0,
                        child: Shimmer(
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/lottee/image_shimmer.gif",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              1.0,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: heights / 2,
                                  width: width / 1,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(
                                        20,
                                      ),
                                      topRight: Radius.circular(
                                        20,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        list[index].images[0],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  list[index].name.toString().toUpperCase(),
                                  style: AppTextStyles.h4,
                                )
                                // Positioned(
                                //   left: 0,
                                //   bottom: 0,
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       color: AppColor.kWhite,
                                //       borderRadius: const BorderRadius.only(
                                //         bottomLeft: Radius.circular(
                                //           20,
                                //         ),
                                //         bottomRight: Radius.circular(
                                //           20,
                                //         ),
                                //       ),
                                //     ),
                                //     width: width,
                                //     height: 80,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
