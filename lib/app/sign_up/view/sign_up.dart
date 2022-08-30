import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/sign_up/view_model/signup_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SignUpProvider>().disposeControll();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://media.istockphoto.com/vectors/abstract-blue-background-vector-id1176497914?k=20&m=1176497914&s=612x612&w=0&h=wdmxpn1V3JfHjKspCXQgF5NzNe_VlED9hu85jlfKPo0='),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/mc.png",
              width: MediaQuery.of(context).size.width / 2.5,
            ),
            const SignupForm(),
          ],
        ),
      ),
    );
  }
}
