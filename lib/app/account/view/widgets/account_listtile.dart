import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/account/view/account_screen.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/my_wishlist/view/wishlilst.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/routes/routes.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.screen,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  final dynamic screen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 15,
      ),
      onTap: () {
        RoutesProvider.nextScreen(screen: screen);
      },
    );
  }
}

class AcountUserSection extends StatelessWidget {
  const AcountUserSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.kWhite,
      child: Column(
        children: const [
          AccountListTile(
            screen: OrderSummary(),
            title: 'Orders',
            subtitle: 'Check your order status',
            icon: Icons.wallet_giftcard_rounded,
          ),
          AccountListTile(
            screen: AccountScreen(),
            title: 'Help',
            subtitle: 'Help regarding your purchases',
            icon: Icons.live_help_outlined,
          ),
          AccountListTile(
            screen: MyWishListScreen(),
            title: 'Wish List',
            subtitle: 'Your Most Loved Items',
            icon: Icons.favorite_border_outlined,
          ),
        ],
      ),
    );
  }
}
