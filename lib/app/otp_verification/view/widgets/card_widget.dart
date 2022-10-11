import 'package:flutter/material.dart';
import 'pincode.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      elevation: 10.0,
      margin: const EdgeInsets.all(
        12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 25.0,
              ),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Verification\n\n",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xFF0278AE,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: "Enter the OTP send to your Email",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(
                          0xFF373A40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const PinCodeFieldWidget(),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Resend OTP',
            ),
          )
        ],
      ),
    );
  }
}
