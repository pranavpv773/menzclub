import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/constants/colors.dart';

class ActiveApppbarWidget extends StatelessWidget {
  const ActiveApppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: primary1,
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 30.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: kWhite,
            leading: Icon(
              Icons.menu,
              color: primary,
            ),
            primary: false,
            title: const TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: primary),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: primary),
                onPressed: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
