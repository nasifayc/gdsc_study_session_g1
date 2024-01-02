import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Stack(
          children: [
            Container(
              height: 500,
              width: 500,
              color: Colors.green,
            ),
            Positioned(
              top: 10,
              left: 150,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.blue,
              ),
            ),
            Positioned(
              bottom: 160,
              left: 160,
              child: Container(
                height: 180,
                width: 180,
                color: Colors.red,
                child: const Center(child: Text("Some Text")),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
