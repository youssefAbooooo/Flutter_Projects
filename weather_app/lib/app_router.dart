import 'package:flutter/material.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';

class MyAppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchView());
    }
    return null;
  }
}
