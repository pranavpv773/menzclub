// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:menz_cart_app/app/jeans/view_model/jeans_provider.dart';
import 'package:menz_cart_app/app/shirt/view_model/shirt_provider.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_provider.dart';
import 'package:menz_cart_app/app/t_shirt/view_model/t_shirt_provider.dart';
import 'package:menz_cart_app/app/watches/view_model/watch_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/appbar_widget.dart';
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
