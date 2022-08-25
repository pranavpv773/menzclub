import 'package:flutter/material.dart';
import 'package:menz_cart_app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_nav.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: context
          .read<GlobalProvider>()
          .pages[context.read<GlobalProvider>().pageIndex],
      bottomNavigationBar: const BottomNav(),
    );
  }
}
