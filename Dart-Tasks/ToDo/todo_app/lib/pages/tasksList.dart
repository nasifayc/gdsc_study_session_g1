import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/taskManager.dart';
import 'package:todo_app/widgets/widgets.dart';
import 'createTask.dart';
import 'taskDetail.dart';

// This page display the list of task created so far
class TaskListPage extends StatefulWidget {
  const TaskListPage(this.title, {super.key});

  final String title;

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final tasks = Provider.of<TaskManager>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Theme.of(context).primaryColor,
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
            icon: Icon(
              Icons.more_vert,
              size: 40,
              color: Theme.of(context).primaryColor,
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
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 40, bottom: 10),
              child: const StyledText(
                text: 'Tasks List',
                textFontSize: 18,
                textColor: Color.fromARGB(255, 124, 119, 119),
                isBold: true,
              ),
            ),
            Container(
                height: screenHeight * 0.4,
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: tasks.isEmpty
                    ? const Center(
                        child: StyledText(
                            text: 'Empty List ',
                            textColor: Color.fromARGB(255, 191, 191, 191),
                            isBold: true,
                            textFontSize: 20),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TaskDetail(task: tasks[index])));
                                },
                                child: StyledCard(
                                    task: tasks[index], index: index),
                              ),
                              const SizedBox(
                                height: 15,
                              )
                            ],
                          );
                        },
                      )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 46,
              width: 219,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const TaskCreator(title: 'Create new task'),
                    ),
                  )
                      .then((value) {
                    setState(() {});
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                    maximumSize: const MaterialStatePropertyAll(Size(100, 50))),
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
