import 'package:flutter/material.dart';
import 'package:menz_cart_app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class NotImportant extends StatelessWidget {
  const NotImportant({
    Key? key,
    required this.heights,
  }) : super(key: key);

  final double heights;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: heights / 4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                context.read<HomeProvider>().banners[0]),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 60,
                    child: Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://1000logos.net/wp-content/uploads/2017/05/PUMA-logo.jpg'),
                              fit: BoxFit.contain)),
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: heights / 4,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(
            //                 context.read<HomeProvider>().banners[0]),
            //             fit: BoxFit.cover)),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: heights / 4,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: NetworkImage(
            //                 context.read<HomeProvider>().banners[0]),
            //             fit: BoxFit.cover)),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
