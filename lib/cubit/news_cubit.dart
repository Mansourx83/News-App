import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'package:news/models/articles%20_model.dart';
import 'package:news/repo/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  NewsModel? news;
  void getNews() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      emit(
        NewsNoInternet(),
      );
    }
    try {
      emit(NewsLoaded());
      news = await News().getBusinessNews();
      emit(
        NewsSuccess(news: news!),
      );
    } catch (e) {
      if (news == null) {
        emit(
          NewsFailed(
            error: e.toString(),
          ),
        );
      } else {
        emit(
          NewsSuccess(news: news!),
        );
      }
    }
  }
}
