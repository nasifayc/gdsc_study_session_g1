import 'package:flutter/material.dart';
import 'package:todo_app/frame1.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homepage',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 215, 113, 76),
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
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/stick-removebg-preview.png',
            width: screenWidth,
            height: 483,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Frame1Body('Todo List'),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
