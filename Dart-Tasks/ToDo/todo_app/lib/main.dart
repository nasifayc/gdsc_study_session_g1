import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/taskManager.dart';
import 'package:todo_app/pages/homepage.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => TaskManager()))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homepage',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 215, 113, 76),
        ),
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 215, 113, 76),
            ),
            child: const Homepage(),
          ),
        ),
      ),
    );
  }
}

