import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  Future<List<ArticleModel>>? future;

  @override
  void initState() {
    future = NewsService(Dio()).getTopHeadLines(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          //! if the data arrived --> show it
          if (snapshot.hasData) {
            return NewsListVeiw(articlesList: snapshot.data!);
          } else if (snapshot.hasError) {
            //! if there is an ERROR --> show ERROR message
            return const SliverFillRemaining(
              child: Center(
                child: Text('there is an ERROR, Try again later'),
              ),
            );
          } else {
            //! if the data didn't arrive and there is no ERROR, then the data is loading.
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
