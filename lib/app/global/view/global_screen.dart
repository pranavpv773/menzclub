import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/appbar_widget.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/bottom_navy.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: context.watch<GlobalProvider>().showAppbar == true
            ? const PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: ActiveApppbarWidget(),
              )
            : const PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: SizedBox(),
              ),
        body: Consumer<GlobalProvider>(builder: (context, value, _) {
          return value.pages[value.pageIndex];
        }),
        bottomNavigationBar: const BottomNavyWidget(),
      ),
    );
  }
}
