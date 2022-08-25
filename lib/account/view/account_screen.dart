import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';
import 'widgets/account_listtile.dart';
import 'widgets/profile_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: ListView(
        children: [
          const ProfileCard(),
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10),
            child: AcountUserSection(),
          ),
          ColoredBox(
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('ABOUT US'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('PRIVACY POLICY'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('TERMS OF USE'),
                ),
              ],
            ),
          )
        ],
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
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            title: Text(
              'SIGN UP',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
