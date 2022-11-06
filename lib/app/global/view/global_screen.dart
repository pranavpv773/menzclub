// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
import 'package:menz_cart_app/app/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/appbar_widget.dart';
import 'widgets/bottom_navy.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: context.watch<GlobalProvider>().showAppbar == true
        //     ? const PreferredSize(
        //         preferredSize: Size.fromHeight(120),
        //         child: ActiveApppbarWidget(),
        //       )
        //     : const PreferredSize(
        //         preferredSize: Size.fromHeight(120),
        //         child: SizedBox(),
        //       ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              context.watch<GlobalProvider>().showAppbar == false
                  ? const SliverAppBar(
                      toolbarHeight: 0,
                    )
                  : SliverAppBar(
                      backgroundColor: AppColor.primary1,
                      expandedHeight: 120.0,
                      floating: false,
                      pinned: false,
                      snap: false,
                      flexibleSpace:
                          context.watch<GlobalProvider>().showAppbar == true
                              ? const PreferredSize(
                                  preferredSize: Size.fromHeight(120),
                                  child: ActiveApppbarWidget(),
                                )
                              : const PreferredSize(
                                  preferredSize: Size.fromHeight(0),
                                  child: SizedBox(),
                                ),
                    )
            ];
          },
          body: WillPopScope(
            onWillPop: context.watch<GlobalProvider>().onWillPop,
            child: Consumer<GlobalProvider>(
              builder: (context, value, _) {
                return context.watch<HomeProvider>().checkingFn
                    ? value.pages[value.pageIndex]
                    : value.shimmer[value.pageIndex];
              },
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavyWidget(),
      ),
    );
  }
}
