import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    'Deliver to:Pranav',
                  ),
                  Text(
                    'ADDRESS',
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: AppColor.primary2,
                ),
                child: const Text(
                  'Change',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
