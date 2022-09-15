import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavyWidget extends StatelessWidget {
  const BottomNavyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      curve: Curves.ease,
      currentIndex: context.watch<GlobalProvider>().pageIndex,
      // showElevation: true,
      onTap: (index) => context.read<GlobalProvider>().onTabIndexChange(index),
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home_rounded),
          title: const Text('Home'),
          selectedColor: Colors.red,
          unselectedColor: primary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.widgets_rounded),
          title: const Text('Categories'),
          selectedColor: Colors.purpleAccent,
          unselectedColor: primary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          selectedColor: Colors.pink,
          unselectedColor: primary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Account'),
          selectedColor: primary2,
          unselectedColor: primary,
        ),
      ],
    );
  }
}
