part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoaded extends NewsState {}

final class NewsSuccess extends NewsState {
  final NewsModel news;

  NewsSuccess({required this.news});
}

final class NewsFailed extends NewsState {
  final String? error;

  NewsFailed({this.error});
}
final class NewsNoInternet extends NewsState{}
