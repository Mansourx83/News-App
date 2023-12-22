import 'package:flutter/material.dart';
import 'package:news/models/articles%20_model.dart';
import 'package:news/repo/news_repo.dart';
import 'package:news/view/articles.dart';

class ListNews extends StatefulWidget {
  const ListNews({
    super.key,
  });

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  late Future<ArticlesModel> getNews;
  @override
  void initState() {
    super.initState();
    getNews = News().getBusinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blueAccent,
      onRefresh: () async {
        setState(() {
          getNews = News().getBusinessNews();
        });
      },
      child: FutureBuilder(
          future: getNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final res = snapshot.data;
              final data = res!.articles;

              return ListOfArticles(data: data);
            }
            //the data is fetch or get , waiting data
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            }
            //data =null , error in connection
            return const Center(
              child: Text('The server have error , please try again'),
            );
          }),
    );
  }
}

class ListOfArticles extends StatelessWidget {
  const ListOfArticles({
    super.key,
    required this.data,
  });

  final List<Article> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final items = data[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Articles(
                    articls: items,
                  );
                },
              ),
            );
          },
          title: Text(
            items.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            items.description ?? 'Empty description',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          leading: Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(items.urlToImage ??
                      'https://i.cbc.ca/1.4066392.1541713557!/fileImage/httpImage/image.jpg_gen/derivatives/16x9_1180/cbc-logo-horizontal.jpg'),
                ),
              )),
        );
      },
    );
  }
}
