import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/news_cubit.dart';

import 'package:news/widgets/list_articles.dart';

class ListNews extends StatefulWidget {
  const ListNews({
    Key? key,
  }) : super(key: key);

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.blueAccent,
      onRefresh: () async {
        context.read<NewsCubit>().getNews();
      },
      child: BlocListener<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsNoInternet) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No Internet Connection'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            print('state is $state');
            if (state is NewsLoaded) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
            } else if (state is NewsSuccess) {
              return ListOfArticles(data: state.news.articles);
            } else if (state is NewsFailed) {
              print(state.error);
              return const Center(
                child: Text('Error try again !'),
              );
            } else {
              return const SizedBox(
                child: Text(
                  'data',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
