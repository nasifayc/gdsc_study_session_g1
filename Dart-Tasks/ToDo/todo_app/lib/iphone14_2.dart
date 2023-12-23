import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext contex) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
            color: Color.fromARGB(255, 215, 113, 76),
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              size: 40,
              color: Color.fromARGB(255, 215, 113, 76),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/images/shopping-list 1.png', width: 207),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Title',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  'UI/UX App Design',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                height: 100,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  'First I have to animate the logo and prototyping my design. it\'s very important',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Deadline',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: screenWidth,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  'April 29, 2023',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
