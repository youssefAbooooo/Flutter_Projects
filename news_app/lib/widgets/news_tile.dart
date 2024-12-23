import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NewsWebView();
            },
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            //!   if image is null show Text('ERROR')
            child: (articleModel.image != null)
                ? Image.network(
                    articleModel.image!,
                    //!   errorBuilder: Displays a fallback widget if the image fails to load.
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Center(child: Text('Failed to load image')));
                    },
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Center(child: Text('NO IMAGE')),
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            //!   if the subtitle is null show nothing
            articleModel.subTitle ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
