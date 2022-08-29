import 'package:flutter/material.dart';

class ThirdBanner extends StatelessWidget {
  const ThirdBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://scontent-bom1-1.xx.fbcdn.net/v/t1.6435-9/39132368_10156660247218221_880685569485570048_n.jpg?stp=dst-jpg_p180x540&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=a5Do2QIJHMkAX99Q7QM&_nc_ht=scontent-bom1-1.xx&oh=00_AT-EO-AeNI4u_HUZ5oQpZixb77JweMnlkX1mM9TG-menbQ&oe=632C7FEE',
                  ),
                  fit: BoxFit.fill),
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/banner4.webp',
                ),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
