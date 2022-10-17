import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';

class SearchProvider with ChangeNotifier {
  List temp = [];
  final searchController = TextEditingController();
  onChangeFunction(BuildContext context) {
    if (searchController.text.isEmpty) {
      notifyListeners();
    } else {
      temp.clear();
      for (dynamic i in allProducts) {
        if (i.name.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ) ||
            (i.category.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ))) {
          temp.add(i);
        }
        notifyListeners();
      }
    }
  }
}
