import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gdsc_bookstore/widgets/usersReview.dart';
import 'package:gdsc_bookstore/widgets/horizontalscrollView.dart';
import 'package:gdsc_bookstore/widgets/styledButton.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.bookPath, required this.title});

  final String bookPath;
  final String title;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 30,
            // color: Color.fromARGB(255, 151, 56, 30),
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: 340,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.bookPath),
                          fit: BoxFit.cover)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Positioned(
                    left: 90,
                    bottom: 40,
                    child: Container(
                      width: 200,
                      height: 220,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3.0),
                          image: DecorationImage(
                              image: AssetImage(widget.bookPath),
                              fit: BoxFit.cover)),
                    ))
              ],
            ),
            Container(
              width: screenWidth,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Book by Carl Sagan | 2h 30m',
                      style: TextStyle(
                          color: Color.fromARGB(255, 97, 94, 94), fontSize: 17),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Rating(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconBox(
                            content: Text(
                          'Free',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        )),
                        IconBox(
                            content: Icon(
                          Icons.favorite_border_outlined,
                          color: Color.fromARGB(255, 104, 104, 104),
                        )),
                        IconBox(
                            content: Icon(
                          Icons.share,
                          color: Color.fromARGB(255, 104, 104, 104),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                children: [
                  Headings(heading: 'Book Information'),
                  SizedBox(height: 20),
                  Message(),
                  SizedBox(height: 20),
                  Headings(heading: 'About Author'),
                  SizedBox(height: 20),
                  Message(),
                  SizedBox(height: 30),
                  UserReview(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Related Books',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color.fromARGB(255, 151, 56, 30),
                      )
                    ],
                  ),

                  // Related Books
                  SizedBox(
                    height: 300,
                    child: HorizontalScroll(
                      bookTitle: [
                        'Cosmos',
                        'Karma pays Baxk',
                        'Rich Dad Poor Dad Ro. T',
                        'The Power of Now',
                        'Born a crime by Trevor Noha'
                      ],
                      images: [
                        'assets/images/cover1.webp',
                        'assets/images/cover2.webp',
                        'assets/images/cover3.webp',
                        'assets/images/cover4.webp',
                        'assets/images/cover5.webp'
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Start Reading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Coming Soon . . .'),
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.blue,
                    ));
                  },
                  child: const Button(name: 'Start Reading')),
            )
          ],
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 166, 7),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 166, 7),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 166, 7),
        ),
        Icon(
          Icons.star,
          color: Color.fromARGB(255, 252, 166, 7),
        ),
        Icon(
          Icons.star_border_outlined,
          color: Color.fromARGB(255, 252, 166, 7),
        ),
      ],
    );
  }
}

class IconBox extends StatefulWidget {
  const IconBox({super.key, required this.content});
  final Widget content;

  @override
  State<IconBox> createState() => _IconBoxState();
}

class _IconBoxState extends State<IconBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: widget.content,
    );
  }
}

class Headings extends StatelessWidget {
  const Headings({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 151, 56, 30)),
        ),
        const SizedBox(width: 10),
        Text(
          heading,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Cosmos is one of the bestselling science books of can all time. in clear eyed prose, Sagan reaveals a jewellike blue word inhabited by a life form that is just ...',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
    );
  }
}
