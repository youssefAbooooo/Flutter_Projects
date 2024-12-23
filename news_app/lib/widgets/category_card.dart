import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: categoryModel.categoryName);
            },
          ),
        );
      },
      child: Container(
          margin: const EdgeInsets.only(right: 16),
          height: 85,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(categoryModel.image), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              categoryModel.categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}
