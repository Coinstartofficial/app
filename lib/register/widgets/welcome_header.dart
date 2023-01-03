import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Image(
          image: AssetImage("assets/images/index_icon.png"),
          fit: BoxFit.contain,
          width: 124,
          height: 124,
        ),
        SizedBox(
          height: 60,
        ),
        Text(
          'Welcome to',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "coinstart wallet",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
