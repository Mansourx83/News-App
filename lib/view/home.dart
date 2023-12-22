import 'package:flutter/material.dart';
import 'package:news/widgets/list_news.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListNews(),
    );
  }
}

