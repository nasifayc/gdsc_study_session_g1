import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Homepage',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 200, 77, 33),
          ),
          child: const Homepage(),
        ),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/stick-removebg-preview.png',
          width: 483,
          height: 483,
        ),
        const ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
          ),
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
