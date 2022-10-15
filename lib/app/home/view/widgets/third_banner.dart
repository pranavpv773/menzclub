import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ThirdBanner extends StatelessWidget {
  const ThirdBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/rect_frame.jpg',
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Container(
            width: 400,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8OzJEOFMrqSrHluYAfPjHHLEmsK5TGb5XlsfVw9dJEOSQBqyGw64poa7vPYlPIIp0ROA&usqp=CAU',
                ),
                fit: BoxFit.fill,
              ),
            ),
            // child: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: <Widget>[
            //     const SizedBox(width: 20.0, height: 100.0),
            //     const Text(
            //       'Be',
            //       style: TextStyle(fontSize: 43.0),
            //     ),
            //     const SizedBox(width: 20.0, height: 100.0),
            //     DefaultTextStyle(
            //       style: const TextStyle(
            //         fontSize: 40.0,
            //         fontFamily: 'Horizon',
            //       ),
            //       child: AnimatedTextKit(
            //         totalRepeatCount: 100,
            //         animatedTexts: [
            //           RotateAnimatedText('Shirt'),
            //           RotateAnimatedText('Jeans'),
            //           RotateAnimatedText('T-Shirt'),
            //           RotateAnimatedText('Trousers'),
            //           RotateAnimatedText('Watches'),
            //           RotateAnimatedText('Accessories'),
            //         ],
            //         onTap: () {
            //           print("Tap Event");
            //         },
            //       ),
            //     ),
            //   ],
            // )),
          ),
        ),
      ),
    );
  }
}

class TshirtBanner extends StatelessWidget {
  const TshirtBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/rect_frame.jpg',
            ),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Container(
          width: 200,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/banner4.webp',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
