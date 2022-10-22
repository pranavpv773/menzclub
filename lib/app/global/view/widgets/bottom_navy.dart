import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:menz_cart_app/app/my_cart/view_model/cart_provider_two.dart';
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
          icon: const Icon(
            Icons.home_rounded,
          ),
          title: const Text('Home'),
          selectedColor: Colors.red,
          unselectedColor: AppColor.primary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.widgets_rounded,
          ),
          title: const Text('Categories'),
          selectedColor: Colors.purpleAccent,
          unselectedColor: AppColor.primary,
        ),
        SalomonBottomBarItem(
          icon: Consumer<CartNotifier>(builder: (context, val, _) {
            return val.cartList.isEmpty
                ? const Icon(
                    Icons.shopping_cart,
                  )
                : Badge(
                    badgeColor: Colors.pink,
                    badgeContent: Text(
                      val.cartList.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  );
          }),
          title: const Text('Cart'),
          selectedColor: Colors.pink,
          unselectedColor: AppColor.primary,
        ),
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.person,
          ),
          title: const Text('Account'),
          selectedColor: AppColor.primary2,
          unselectedColor: AppColor.primary,
        ),
      ],
    );
  }
}
