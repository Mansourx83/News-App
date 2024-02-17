import 'package:dio/dio.dart';
import 'package:news/models/articles%20_model.dart';

class News {
  final Dio _dio = Dio();

  Future<NewsModel> getBusinessNews() async {
    final Response response = await _dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=df8a6324af6a47378fc877a7b8d4ac77');
    final data = NewsModel.fromJson(response.data);
    return data;
  }
}
