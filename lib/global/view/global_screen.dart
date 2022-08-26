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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Stack(
            children: <Widget>[
              Container(
                // Background
                color: primary,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 50.0,
                left: 20.0,
                right: 20.0,
                child: AppBar(
                  backgroundColor: kWhite,
                  leading: Icon(
                    Icons.menu,
                    color: primary,
                  ),
                  primary: false,
                  title: const TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey))),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search, color: primary),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: primary),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
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
