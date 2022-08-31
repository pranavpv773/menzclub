import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 4,
      height: height / 6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AssetContainerImage extends StatelessWidget {
  const AssetContainerImage({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 4,
      height: height / 6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class ContainerImageChild extends StatelessWidget {
  const ContainerImageChild({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    required this.widget,
  }) : super(key: key);

  final double width;
  final double height;
  final String image;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: widget,
    );
  }
}
