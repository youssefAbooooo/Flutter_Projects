import 'package:flutter/material.dart';

void main() {
  runApp(const BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade700,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 72,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/1704502172296.jfif'),
              ),
            ),
            const Text(
              'Youssef Abd El-Fatah',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 36, 45, 53),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 36, 45, 53),
              endIndent: 64,
              indent: 64,
            ),
            NewCard(icon: Icons.phone, text: '(+20) 1099805486'),
            NewCard(icon: Icons.email, text: 'youssefabdelfatah258@gmail.com'),
          ],
        ),
      ),
    );
  }
}

class NewCard extends StatelessWidget {
  NewCard({required this.icon, required this.text});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 36, 45, 53),
          size: 32,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({required this.icon, required this.text});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              icon,
              color: const Color.fromARGB(255, 36, 45, 53),
              size: 32,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
