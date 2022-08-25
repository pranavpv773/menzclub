import 'package:flutter/material.dart';
import 'package:menz_cart_app/constants/colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProfileCard(),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(89, 156, 168, 250),
          height: 200,
        ),
        Container(
          height: 100,
          color: const Color.fromARGB(224, 78, 88, 151),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLlUIlrkWrEKWhugFbim3s8h33j9Uk4hdRbkHI2TEn7ueop1DQ9yEoiW9vz4_jtJc786A&usqp=CAU',
              width: 120,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 15,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(pBlue),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 70,
                ),
              ),
            ),
            child: Text(
              'LOGIN/SIGN UP',
              style: TextStyle(color: kWhite),
            ),
          ),
        )
      ],
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
