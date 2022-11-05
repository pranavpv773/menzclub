import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/order_summary/view/widgets/shimmer.dart';
import 'package:menz_cart_app/app/order_summary/view_model/order_get_provider.dart';
import 'package:menz_cart_app/app/products/view/product_screen.dart';
import 'package:menz_cart_app/app/products/view_model/products_provider.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'widgets/button.dart';
import 'package:intl/intl.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: const Text('Order Summary'),
      ),
      body: context.watch<OrderNotifierTwo>().isLoad
          ? const OrderShimmerEffect()
          : context.watch<OrderNotifierTwo>().orderList.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/lottee/emptyCart1.gif',
                      ),
                      const Text(
                        "You haven't placed any order yet!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Order section is empty. After placing order,You can track them from here!",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ShopTransparentButton(
                        fn: () {
                          RoutesProvider.nextScreen(
                            screen: ProductsScreen(
                              title: "All Products",
                              list:
                                  context.read<ProductsProvider>().allProducts,
                            ),
                          );
                        },
                        amount: 125,
                        buttonBgColor: Colors.transparent.withOpacity(
                          0.1,
                        ),
                        buttonColor: AppColor.primary,
                        button: "START SHOPPING",
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final data = context.read<OrderNotifierTwo>().orderList;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Slidable(
                          key: const ValueKey(1),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {},
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.cancel,
                                label: 'Cancel Order',
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: data[index].products[0].images[0],
                            ),
                            title: Text(
                              data[index].products[0].productName.toString(),
                            ),
                            trailing: Text(
                              DateFormat('dd-MM-yyyy').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                  data[index].orderedAt!.toInt(),
                                ),
                              ),
                            ),
                            subtitle: const Text("Delivery with in ne week"),
                          )),
                    );
                  },
                  itemCount: context.read<OrderNotifierTwo>().orderList.length,
                ),
    );
  }
}
