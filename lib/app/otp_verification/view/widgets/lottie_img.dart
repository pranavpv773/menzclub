import 'package:flutter/material.dart';

class LottieImageWidget extends StatelessWidget {
  const LottieImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        "assets/lottee/email_verify.gif",
        height: 300.0,
        width: 250.0,
      ),
    );
  }
}
