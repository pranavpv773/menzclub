import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/login/view/login.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlertboxWidget extends StatelessWidget {
  const AlertboxWidget(
      {Key? key,
      required this.title,
      required this.btn,
      required this.function})
      : super(key: key);
  final String title;
  final String btn;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        width: 150,
        height: 120,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/get_started/logi.gif',
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Login',
          ),
          onPressed: () async {
            final shared = await SharedPreferences.getInstance();
            shared.setBool('get_started', true);
            RoutesProvider.nextScreen(
              screen: const LoginScreen(),
            );
          },
        ),
        TextButton(
          onPressed: function,
          child: Text(btn),
        ),
      ],
    );
  }
}
//  showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text(
//                 'Sucessfully added to cart',
//               ),
//               content: Container(
//                 width: 100,
//                 height: 80,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                       'assets/get_started/success_cart.gif',
//                     ),
//                   ),
//                 ),
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('Ok'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             );
//           },
//         );