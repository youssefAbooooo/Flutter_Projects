import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  NewsService(this.dio);
  Dio dio;
  Future<List<ArticleModel>> getTopHeadLines({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=49ad1a7c243e4ac99e069943382dfebe&category=$category');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }
      return articlesList;
    } catch (e) {
      return [];
    }
    // print(articlesList);
  }
}
