import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/utilities/view/container_network.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [ContainerImage(width: width, height: height, image: image)],
    );
  }
}
