import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';
import 'package:menz_cart_app/app/shoes/view_model/shoes_map.dart';
import 'package:menz_cart_app/app/utilities/view/appbar_widget.dart';

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
            GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: height / 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 20,
              ),
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primary1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            height: height / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    list[index]['productImage'].toString(),
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            width: width,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 166, 232, 11),
                            ),
                            child: Center(
                              child: Text(
                                list[index]['productName'].toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
