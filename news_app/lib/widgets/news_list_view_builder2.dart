import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder2 extends StatefulWidget {
  const NewsListViewBuilder2({super.key});

  @override
  State<NewsListViewBuilder2> createState() => _NewsListViewBuilder2State();
}

class _NewsListViewBuilder2State extends State<NewsListViewBuilder2> {
  List<ArticleModel> articlesList = [];
  bool isLoading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  Future<void> getNews() async {
    articlesList =
        await NewsService(Dio()).getTopHeadLines(category: "general");
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          )
        : articlesList.isNotEmpty
            ? NewsListVeiw(articlesList: articlesList)
            : const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text('there is an ERROR, Try again later'),
                ),
              );
  }
}
