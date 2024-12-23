import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsListVeiw extends StatelessWidget {
  const NewsListVeiw({
    super.key,
    required this.articlesList,
  });
  final List<ArticleModel> articlesList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: NewsTile(
              articleModel: articlesList[index],
            ),
          );
        },
        childCount: articlesList.length,
      ),
    );
  }
}
