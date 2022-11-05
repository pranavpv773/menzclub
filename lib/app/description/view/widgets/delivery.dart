import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/sign_up/view/widgets/text_form.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:provider/provider.dart';

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
                children: [
                  const Text(
                    'Deliver to:Pranav',
                  ),
                  context.watch<LoginProvider>().isLogged
                      ? AppTextStyles.userAddress
                      : const Text("Address"),
                ],
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SignUpTextforms(
                              icon: Icons.abc,
                              text: "address",
                              controller: context.read<SignUpProvider>().email,
                              // vertical: 5,
                              obscureText: false,
                              type: TextInputType.multiline,
                              maxLines: 8,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Add Adress",
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
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
