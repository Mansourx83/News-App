import 'package:flutter/material.dart';
import 'package:news/models/articles%20_model.dart';

class Articles extends StatelessWidget {
  final Article articls;

  const Articles({Key? key, required this.articls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE9EEFA),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(articls.urlToImage ??
                      'https://i.cbc.ca/1.4066392.1541713557!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_1180/cbc-logo-horizontal.jpg'),
                  fit: BoxFit.cover, // Adjust the fit based on your needs
                ),
              ),
              height: 200,
            ),
            ListTile(
              title: Text(articls.author ?? 'Not Found'),
              subtitle: Text(articls.publishedAt.toString()),
            ),
            Text(articls.content ?? 'No Description'),
          ],
        ),
      ),
    );
  }
}
