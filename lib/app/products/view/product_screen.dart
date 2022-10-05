// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/filter/view/filter_screen.dart';
import 'package:menz_cart_app/app/products/view/widgets/card_builder.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'widgets/border_container.dart';
import 'widgets/radio_btn.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    Key? key,
    required this.title,
    required this.list,
  }) : super(key: key);
  final String title;
  final List list;
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await context.read<ShirtProvider>().fetchShirtFuction();
    //   await context.read<TshirtProvider>().fetchTShirtFuction();
    //   await context.read<JeansProvider>().fetchJeans();
    //   await context.read<WatchProvider>().fetchWatchesfromApi();
    //   await context.read<ShoesProvider>().fetchShoes();
    // });
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          height / 15,
        ),
        child: CommonAppBarWidget(
          section: title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCardBuilder(
              list: list,
              height: height,
              width: width,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: height / 15,
        color: primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BorderContainerWidget(
              height: height,
              width: width,
              child: const MoreOptions(),
            ),
            BorderContainerWidget(
              height: height,
              width: width,
              child: GestureDetector(
                onTap: () {
                  RoutesProvider.nextScreen(
                    screen: const FilterScreen(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.filter_alt_outlined,
                    ),
                    Text(
                      'FILTER',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: primary,
      child: SizedBox(
        width: width,
        child: const ExpansionTile(
          maintainState: true,
          title: Text('LOGIN / SINGN UP'),
          children: [
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
                title: Text('LOGIN')),
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text('SIGN UP')),
          ],
        ),
      ),
    );
  }
}
