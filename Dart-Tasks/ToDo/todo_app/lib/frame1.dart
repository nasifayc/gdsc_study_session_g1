import 'package:flutter/material.dart';

void main() {
  runApp(const Frame1());
}

class Frame1 extends StatelessWidget {
  const Frame1({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 215, 113, 76)),
          useMaterial3: true),
      home: const Frame1Body('Todo List'),
    );
  }
}

class Frame1Body extends StatefulWidget {
  const Frame1Body(this.title, {super.key});

  final String title;

  @override
  State<Frame1Body> createState() => _Frame1BodyState();
}

class _Frame1BodyState extends State<Frame1Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          widget.title,
        ),
        centerTitle: true,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
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
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 236,
              height: 200,
              child: Image.asset(
                'assets/images/stickman.png',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const StyledText(
                text: 'Tasks List',
                textFontSize: 18,
                textColor: Color.fromARGB(255, 124, 119, 119),
                isBold: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  StyledCard(
                      taskId: 'U',
                      taskDescription: 'UI/UX App Design',
                      deadline: 'April29,2023',
                      taskColor: Colors.yellow),
                  SizedBox(
                    height: 10,
                  ),
                  StyledCard(
                      taskId: 'U',
                      taskDescription: 'UI/UX App Design',
                      deadline: 'April29,2023',
                      taskColor: Colors.green),
                  SizedBox(
                    height: 10,
                  ),
                  StyledCard(
                      taskId: 'V',
                      taskDescription: 'UI/UX App Design',
                      deadline: 'April29,2023',
                      taskColor: Colors.red),
                  SizedBox(
                    height: 10,
                  ),
                  StyledCard(
                      taskId: 'F',
                      taskDescription: 'UI/UX App Design',
                      deadline: 'April29,2025',
                      taskColor: Colors.deepPurple),
                ],
              ),
            ),
            const SizedBox(
              height: 46,
              width: 219,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 215, 113, 76)),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Text(
        softWrap: true,
        text,
        style: TextStyle(
            fontSize: textFontSize,
            fontWeight: isBold ? FontWeight.bold: FontWeight.normal,
            color: textColor,
            ),
      ),
    );
  }
}

class StyledCard extends StatelessWidget {
  const StyledCard(
      {super.key,
      required this.taskId,
      required this.taskDescription,
      required this.deadline,
      required this.taskColor});

  final String taskId, taskDescription, deadline;
  final Color taskColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(taskId, style: const TextStyle(fontSize: 20)),
          StyledText(text: taskDescription, textFontSize: 14,textColor: const Color.fromARGB(255, 124, 119, 119),isBold: true),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(deadline),
            ],
          ),
          Container(
            width: 5,
            height: 40,
            decoration: BoxDecoration(
                color: taskColor, borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
