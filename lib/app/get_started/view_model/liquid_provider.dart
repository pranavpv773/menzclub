import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/get_started/view/first_screen.dart';
import 'package:menz_cart_app/app/get_started/view/second_screen.dart';
import 'package:menz_cart_app/app/get_started/view/third_screen.dart';

class LiquidProvider with ChangeNotifier {
  final page = [
    const FirstScreen(),
    const SecondSdcreen(),
    const ThirdScreen(),
  ];
}
