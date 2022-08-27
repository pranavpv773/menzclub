import 'package:flutter/material.dart';

class ShirtScreen extends StatelessWidget {
  const ShirtScreen({Key? key, required this.string}) : super(key: key);
  final String string;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          string,
          style: const TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
