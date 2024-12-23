import 'package:flutter/material.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatefulWidget {
  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int teamAPoints = 0;

  int teamBPoints = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.orange,
          title: const Text(
            'Points Counter',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Team A',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '$teamAPoints',
                      style: const TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints++;
                        });
                        // print(teamAPoints);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 1 point'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 2 point'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamAPoints += 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 3 point'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 420,
                  child: VerticalDivider(),
                ),
                Column(
                  children: [
                    const Text(
                      'Team B',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      '$teamBPoints',
                      style: const TextStyle(
                        fontSize: 150,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints++;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 1 point'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 2 point'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          teamBPoints += 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: const LinearBorder(),
                      ),
                      child: const Text('Add 3 point'),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  teamAPoints = 0;
                  teamBPoints = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
                shape: const LinearBorder(),
              ),
              child: const Text('Reset'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
