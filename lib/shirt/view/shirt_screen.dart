import 'package:flutter/material.dart';

class ShirtScreen extends StatelessWidget {
  const ShirtScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Shirt',
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
