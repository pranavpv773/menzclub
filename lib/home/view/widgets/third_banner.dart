import 'package:flutter/material.dart';

class ThirdBanner extends StatelessWidget {
  const ThirdBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://scontent-bom1-1.xx.fbcdn.net/v/t1.6435-9/39132368_10156660247218221_880685569485570048_n.jpg?stp=dst-jpg_p180x540&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=a5Do2QIJHMkAX99Q7QM&_nc_ht=scontent-bom1-1.xx&oh=00_AT-EO-AeNI4u_HUZ5oQpZixb77JweMnlkX1mM9TG-menbQ&oe=632C7FEE',
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        height: 150,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/banner4.webp',
              ),
              fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
