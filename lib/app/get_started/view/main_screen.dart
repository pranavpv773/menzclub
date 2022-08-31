import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          pages: context.read<LiquidProvider>().page,
          enableLoop: false,
          fullTransitionValue: 600,
          enableSideReveal: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.1,
        ),
      ),
    );
  }
}
