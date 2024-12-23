import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/sports.avif',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/health.avif',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/science.avif',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/business.avif',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/general.avif',
      categoryName: 'General',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}
