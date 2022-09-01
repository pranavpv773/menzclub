import 'package:flutter/material.dart';

class DescriptionProvider with ChangeNotifier {
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Alert'),
                content: const Text('you have to login first'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
        break;
      case 1:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sucessfully added to cart'),
              content: Container(
                width: 100,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/get_started/success_cart.gif',
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        break;
    }
  }
}
