import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/app_style/color_style.dart';

class SignUpTextforms extends StatelessWidget {
  const SignUpTextforms({
    Key? key,
    required this.icon,
    required this.text,
    required this.obscureText,
    required this.controller,
    this.type,
    this.maxLines,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? type;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please fill this field';
            }
            return null;
          },
          //  keyboardType: TextInputType.visiblePassword,
          controller: controller,
          style: TextStyle(
            color: AppColor.kGrey,
            fontSize: 16,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: AppColor.kWhite,
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                icon,
                color: AppColor.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.kGrey,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.teal,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColor.kGrey,
                width: 2.0,
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 15,
              color: AppColor.kGrey,
            ),
          ),
        ));
  }
}
