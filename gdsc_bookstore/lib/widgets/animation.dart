import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:gdsc_bookstore/screens/bookDetails.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation(
      {super.key, required this.bookTitle, required this.imagePath});
  final String bookTitle;
  final String imagePath;

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/animation/a.json',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Details(
                      bookPath: widget.imagePath, title: widget.bookTitle)));
            },
            child: const AnimatedButton(),
          ),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (BuildContext context, double val, Widget? child) {
          return Stack(
            children: [
              Positioned(
                bottom: val * 80,
                left: 120,
                child: Opacity(
                  opacity: val,
                  child: child,
                ),
              ),
            ],
          );
        },
        child: const Row(
          children: [
            Text(
              'Get Started',
              style: TextStyle(
                  color: Color.fromARGB(255, 151, 56, 30),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Icon(
              Icons.arrow_forward_sharp,
              color: Color.fromARGB(255, 151, 56, 30),
              size: 25,
            )
          ],
        ) //const Button(name: 'Get Started'),
        );
  }
}
