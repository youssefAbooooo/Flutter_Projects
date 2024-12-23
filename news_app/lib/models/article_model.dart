class ArticleModel {
  const ArticleModel(
      {required this.image,
      required this.subTitle,
      required this.title,
      required this.url});
  final String? image;
  final String? title;
  final String? subTitle;
  final String? url;
  //! Always use it with data from the internet
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      subTitle: json['description'],
      title: json['title'],
      url: json['url'],
    );
  }
}
