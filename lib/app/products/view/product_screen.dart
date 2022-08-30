import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/products/view/widgets/card_builder.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MoreOptions(
                  icon: Icons.filter_alt_outlined,
                ),
                MoreOptions(
                  icon: Icons.sort,
                ),
              ],
            ),
            ProductCardBuilder(height: height, list: list, width: width),
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
