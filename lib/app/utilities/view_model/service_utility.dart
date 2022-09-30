import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/utilities/view/bottom_model.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';

class ServicesProvider with ChangeNotifier {
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function: context.read<ShirtProvider>().fetchShirtFuction(context),
            title: 'SHIRT',
          ),
        );
        break;
      case 1:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'T-SHIRT',
          ),
        );
        break;
      case 2:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'JEANS',
          ),
        );
        break;
      case 3:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function: context.read<ShirtProvider>().fetchShirtFuction(context),
            title: 'TROUSERS',
          ),
        );
        break;
      case 4:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function: context.read<ShirtProvider>().fetchShirtFuction(context),
            title: 'ETHIC-WEAR',
          ),
        );
        break;
      case 5:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function: context.read<ShirtProvider>().fetchShirtFuction(context),
            title: 'SHOES',
          ),
        );
        break;
      case 6:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'SHOES',
          ),
        );
        break;
      case 7:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'WATCHES',
          ),
        );
        break;
      case 8:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'SHOES',
          ),
        );
        break;
      case 9:
        RoutesProvider.nextScreen(
          screen: ProductsScreen(
            function:
                context.read<TshirtProvider>().fetchTShirtFuction(context),
            title: 'SHOES',
          ),
        );
        break;
    }
  }

  settingModalBottomSheet(
    context,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext ctx) {
        return const HomeModalBottom();
      },
    );
  }
}
