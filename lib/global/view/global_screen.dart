import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'package:menz_cart_app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_nav.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          title: Text(
            'menZcart',
            style: TextStyle(color: primary),
          ),
        ),
        body: Consumer<GlobalProvider>(builder: (context, value, _) {
          return value.pages[value.pageIndex];
        }),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}
