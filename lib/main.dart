import 'package:flutter/material.dart';
import 'package:news/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
