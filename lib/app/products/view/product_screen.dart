import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/filter/view/filter_screen.dart';
import 'package:menz_cart_app/app/products/view/widgets/card_builder.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'widgets/radio_btn.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key, required this.title, required this.list})
      : super(key: key);
  final String title;
  final List list;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height / 15),
        child: CommonAppBarWidget(
          section: title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCardBuilder(height: height, list: list, width: width),
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
                  RoutesProvider.nextScreen(screen: const FilterScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.filter_alt_outlined),
                    Text('FILTER'),
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

class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width / 2,
        height: height / 10,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
          color: kWhite,
          width: 2,
        )),
        child: child);
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
        width: width / 2.5,
        child: const ExpansionTile(
          maintainState: true,
          title: Text('SORT'),
          children: [
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
                title: Text('Blue')),
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text('Red')),
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                title: Text('Amber')),
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text('Pink')),
            ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text('Green')),
          ],
        ),
      ),
    );
  }
}
