import 'package:flutter/material.dart';
import 'package:toku/components/category_item.dart';
import 'package:toku/screens/colors_page.dart';
import 'package:toku/screens/family_page.dart';
import 'package:toku/screens/numbers_page.dart';
import 'package:toku/screens/phrases_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Toku'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Category(
                    color: Colors.blueGrey,
                    text: 'Numbers',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const NumbersPage();
                      }));
                    },
                  ),
                ),
                Expanded(
                  child: Category(
                    color: Colors.grey,
                    text: 'Faimly\nMembers',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const FamilyPage();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Category(
                    color: Colors.lightBlue,
                    text: 'Colors',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ColorsPage();
                      }));
                    },
                  ),
                ),
                Expanded(
                  child: Category(
                    color: Colors.blue,
                    text: 'Phrases',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PhrasesPage();
                      }));
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
