import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'iphone14_1.dart';
import 'iphone14_2.dart';
import '../Provider/taskModel.dart';

class Frame1Body extends StatefulWidget {
  const Frame1Body(this.title, {super.key});

  final String title;

  @override
  State<Frame1Body> createState() => _Frame1BodyState();
}

class _Frame1BodyState extends State<Frame1Body> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Processing Request'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            icon: const Icon(
              Icons.more_vert,
              size: 40,
              color: Color.fromARGB(255, 215, 113, 76),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: screenWidth,
                height: 220,
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  'assets/images/stickman.png',
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 40),
              child: const StyledText(
                text: 'Tasks List',
                textFontSize: 18,
                textColor: Color.fromARGB(255, 124, 119, 119),
                isBold: true,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.only(
                    top: 10.0, left: 15, right: 15, bottom: 20),
                child: ListView.builder(
                  itemCount: context.watch<TaskCRUD>().tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TaskDetail(
                                    mainTask: context.watch<TaskCRUD>().tasks[index].title,
                                    dueDate: context.watch<TaskCRUD>().tasks[index].date,
                                    description: context.watch<TaskCRUD>().tasks[index].description)));
                          },
                          child: StyledCard(
                              taskDescription: context.watch<TaskCRUD>().tasks[index].title,
                              taskId: context.watch<TaskCRUD>().tasks[index].title[0],
                              deadline: context.watch<TaskCRUD>().tasks[index].date,
                              taskColor: const Color.fromARGB(255, 142, 10, 1)),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  },
                )),
            SizedBox(
              height: 46,
              width: 219,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const Iphone14Body(title: 'Create new task'),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 215, 113, 76)),
                    maximumSize: MaterialStatePropertyAll(Size(100, 50))),
                child: const Text(
                  'Create Task',
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
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
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
      padding: const EdgeInsets.only(left: 8, right: 0, top: 6, bottom: 10),
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
          StyledText(
              text: taskDescription,
              textFontSize: 16,
              textColor: const Color.fromARGB(255, 124, 119, 119),
              isBold: true),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(deadline),
            ],
          ),
          Container(
            width: 8,
            height: 50,
            decoration: BoxDecoration(
                color: taskColor, borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
