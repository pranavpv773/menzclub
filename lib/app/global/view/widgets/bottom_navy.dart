import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';

class BottomNavyWidget extends StatelessWidget {
  const BottomNavyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      curve: Curves.ease,
      selectedIndex: context.watch<GlobalProvider>().pageIndex,
      showElevation: true,
      onItemSelected: (index) =>
          context.read<GlobalProvider>().onTabIndexChange(index),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home_rounded),
          title: const Text('Home'),
          activeColor: Colors.red,
          inactiveColor: primary,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.widgets_rounded),
          title: const Text('Categories'),
          activeColor: Colors.purpleAccent,
          inactiveColor: primary,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          activeColor: Colors.pink,
          inactiveColor: primary,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Account'),
          activeColor: primary2,
          inactiveColor: primary,
        ),
      ],
    );
  }
}
