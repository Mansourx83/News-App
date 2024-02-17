import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:news/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 6,
      ),
      () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ), (route) => false);
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9EEFA),
      body: Center(
        child: SizedBox(
          width: 200,
          child: TextLiquidFill(
            text: 'News App',
            waveColor: Colors.blueAccent,
            boxBackgroundColor: Color(0xffE9EEFA),
            textStyle: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            boxHeight: 150.0,
          ),
        ),
      ),
    );
  }
}
