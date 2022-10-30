import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';
import 'package:menz_cart_app/app/app_style/text_style.dart';
import 'package:menz_cart_app/app/login/view_model/login_provider.dart';
import 'package:menz_cart_app/app/my_cart/view/cart_screen.dart';
import 'package:menz_cart_app/app/user/view_model/user_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/account_listtile.dart';
import 'widgets/profile_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SafeArea(
        child: ListView(
          children: [
            context.watch<LoginProvider>().isLogged
                ? Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: AppColor.primary1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: AppColor.kGrey,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColor.kWhite,
                              child: Text(
                                context
                                    .read<UserProvider>()
                                    .userList[0]
                                    .userName[0]
                                    .toUpperCase(),
                                style: AppTextStyles.h3,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextStyleWidget(
                              text:
                                  "Hello ${context.read<UserProvider>().userList[0].userName}",
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const ProfileCard(),
            const Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10,
              ),
              child: AcountUserSection(),
            ),
            ColoredBox(
              color: AppColor.kWhite,
              child: Column(
                children: [
                  const AcountTexWidgget(
                    text: 'ABOUT US',
                  ),
                  const AcountTexWidgget(
                    text: 'PRIVACY POLICY',
                  ),
                  const AcountTexWidgget(
                    text: 'TERMS OF USE',
                  ),
                  Visibility(
                    visible: context.watch<LoginProvider>().isLogged,
                    child: GestureDetector(
                      onTap: () {
                        context.read<LoginProvider>().logOut();
                      },
                      child: const AcountTexWidgget(
                        text: 'Logout',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AcountTexWidgget extends StatelessWidget {
  const AcountTexWidgget({
    Key? key,
    required this.text,
    this.onTab,
  }) : super(key: key);
  final String text;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(),
      onTap: onTab ?? () {},
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class ExpandCard extends StatelessWidget {
  const ExpandCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ExpansionTile(
        title: Text(
          "LOGIN/SIGN UP",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'SIGN UP',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
