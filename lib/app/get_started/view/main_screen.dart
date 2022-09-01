import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:menz_cart_app/app/get_started/view_model/liquid_provider.dart';
import 'package:provider/provider.dart';

class LiquidSwiperScreen extends StatelessWidget {
  const LiquidSwiperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LiquidSwipe(
          positionSlideIcon: 0.8,

          slideIconWidget: const Icon(Icons.arrow_back_ios),
          pages: context.read<LiquidProvider>().page,
          enableLoop: false,
          fullTransitionValue: 600,
          enableSideReveal: true,
          waveType: WaveType.liquidReveal,
          // positionSlideIcon: 0.1,
        ),
      ),
    );
  }
}
