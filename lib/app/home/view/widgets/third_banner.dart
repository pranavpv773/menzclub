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
            fit: BoxFit.fill,
          ),
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
                  'https://m.media-amazon.com/images/S/stores-image-uploads-eu-prod/8/AmazonStores/A21TJRUUN4KGV/b8f57e0aee6a4d4e5fd14c4cc5ddcd67.w600.h300.jpg',
                ),
                fit: BoxFit.fill,
              ),
            ),
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
          fit: BoxFit.fill,
        ),
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
