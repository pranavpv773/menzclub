import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/account/view/account_screen.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_wishlist/view/wishlilst.dart';
import 'package:menz_cart_app/app/order_summary/view/order.dart';
import 'package:menz_cart_app/app/order_summary/view_model/order_get_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
        context.read<OrderNotifierTwo>().fetchUserOrder(context);
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
        children: [
          Visibility(
            visible: context.watch<LoginProvider>().isLogged,
            child: const AccountListTile(
              screen: OrderSummary(),
              title: 'Orders',
              subtitle: 'Check your order status',
              icon: Icons.wallet_giftcard_rounded,
            ),
          ),
          const AccountListTile(
            screen: AccountScreen(),
            title: 'Help',
            subtitle: 'Help regarding your purchases',
            icon: Icons.live_help_outlined,
          ),
          Visibility(
            visible: context.watch<LoginProvider>().isLogged,
            child: const AccountListTile(
              screen: MyWishListScreen(),
              title: 'Wish List',
              subtitle: 'Your Most Loved Items',
              icon: Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
