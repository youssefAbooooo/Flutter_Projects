import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
