import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_map.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/shirt/view_model/map_shirt.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_map.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/tshirt.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_map.dart';
import 'package:menz_cart_app/routes/routes.dart';

class ServicesProvider with ChangeNotifier {
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shirtList,
            title: 'SHIRT',
          ),
        );
        break;
      case 1:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: tShirtList,
            title: 'T-SHIRT',
          ),
        );
        break;
      case 2:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: jeansList,
            title: 'JEANS',
          ),
        );
        break;
      case 3:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shirtList,
            title: 'TROUSERS',
          ),
        );
        break;
      case 4:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shirtList,
            title: 'ETHIC-WEAR',
          ),
        );
        break;
      case 5:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shoesMap,
            title: 'SHOES',
          ),
        );
        break;
      case 6:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shoesMap,
            title: 'SHOES',
          ),
        );
        break;
      case 7:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: watchMap,
            title: 'WATCHES',
          ),
        );
        break;
      case 8:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shoesMap,
            title: 'SHOES',
          ),
        );
        break;
      case 9:
        RoutesProvider.nextScreen(
          screen: const ProductsScreen(
            list: shoesMap,
            title: 'SHOES',
          ),
        );
        break;
    }
  }
}
