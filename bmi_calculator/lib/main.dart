import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // scaffoldBackgroundColor: const Color(0xFF1d2136),#0A0D22
        scaffoldBackgroundColor: const Color(0xFF0E1336),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF090D21),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
      },
    );
  }
}

// ThemeData(
// colorScheme: const ColorScheme(
// brightness: Brightness.light,
// primary: Colors.blue,
// onPrimary: Colors.blue,
// secondary: Colors.blue,
// onSecondary: Colors.blue,
// error: Colors.blue,
// onError: Colors.blue,
// surface: Color(0xFF1d2136),
// onSurface: Colors.white),
// ),
