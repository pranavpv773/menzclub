import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/t_shirt/api_services/api_services.dart';
import 'package:menz_cart_app/app/t_shirt/model/tshirt_model.dart';
import 'package:provider/provider.dart';

class TshirtProvider with ChangeNotifier {
  Future<void> fetchTShirtFuction(
    BuildContext context,
  ) async {
    log('Reached');
    context.read<ShirtProvider>().shirtMapList.clear();

    List<TshirtModel> resp = await TShirtApiServices.fetchApiTshirts(context);
    if (resp.isNotEmpty) {
      // ignore: use_build_context_synchronously
      context.read<ShirtProvider>().shirtMapList.addAll(resp);

      notifyListeners();
    } else {}

    notifyListeners();
  }
}
