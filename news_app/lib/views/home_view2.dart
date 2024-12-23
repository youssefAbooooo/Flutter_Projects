import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_listview.dart';

class HomeView2 extends StatelessWidget {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            CategoriesListview(),
            SizedBox(
              height: 32,
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
