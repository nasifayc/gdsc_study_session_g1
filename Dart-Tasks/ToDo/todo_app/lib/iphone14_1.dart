import 'package:flutter/material.dart';

void main() {
  runApp(const IPhone14());
}

class IPhone14 extends StatelessWidget {
  const IPhone14({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iPhone14-1',
        home: Iphone14Body(title: 'Create new task'));
  }
}

class Iphone14Body extends StatefulWidget {
  const Iphone14Body({super.key, required this.title});

  final String title;

  @override
  State<Iphone14Body> createState() => _Iphone14BodyState();
}

class _Iphone14BodyState extends State<Iphone14Body> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.chevron_left,
            size: 60,
            color: Color.fromARGB(255, 215, 113, 76),
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              size: 60,
              color: Color.fromARGB(255, 215, 113, 76),
            ),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20),
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                )
              ],
            ),
            child: const StyledText(
                text: 'Create new task',
                textFontSize: 20,
                textColor: Colors.black,
                isBold: true),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                    text: 'Main task name',
                    textFontSize: 18,
                    textColor:
                        const Color.fromARGB(251, 255, 17, 0).withOpacity(0.5),
                    isBold: true),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const StyledText(
                      text: "UI/UX App Design",
                      textFontSize: 18,
                      textColor: Color.fromARGB(255, 116, 115, 115),
                      isBold: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                StyledText(
                    text: 'Due date',
                    textFontSize: 18,
                    textColor:
                        const Color.fromARGB(251, 255, 17, 0).withOpacity(0.5),
                    isBold: true),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 22, right: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const StyledText(
                          text: "April 29,2023 12:30 AM",
                          textFontSize: 18,
                          textColor: Color.fromARGB(255, 116, 115, 115),
                          isBold: true),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.calendar_month,
                          color: const Color.fromARGB(251, 255, 17, 0)
                              .withOpacity(0.5),
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                StyledText(
                    text: 'Description',
                    textFontSize: 18,
                    textColor:
                        const Color.fromARGB(251, 255, 17, 0).withOpacity(0.5),
                    isBold: true),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  width: screenWidth,
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const StyledText(
                      text:
                          "First i have to animate the logo and later prototyping my design. it's very important",
                      textFontSize: 16,
                      textColor: Color.fromARGB(255, 116, 115, 115),
                      isBold: true),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 215, 113, 76)),
                ),
                child: StyledText(
                    text: 'Add task',
                    textFontSize: 18,
                    textColor: Colors.white,
                    isBold: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.text,
      required this.textFontSize,
      required this.textColor,
      required this.isBold});

  final String text;
  final double textFontSize;
  final Color textColor;
  final bool isBold;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: textFontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: textColor),
    );
  }
}
