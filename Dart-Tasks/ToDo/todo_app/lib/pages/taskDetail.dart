import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/task.dart';
import 'package:todo_app/Provider/taskManager.dart';

// Detail description of or task
class TaskDetail extends StatefulWidget {
  const TaskDetail(
      {super.key, this.title = 'Task Details', required this.task});
  final String title;
  final Task task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
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
          icon: Icon(
            Icons.chevron_left,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions:  [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/images/shopping-list 1.png',
                height: MediaQuery.of(context).size.height * 0.259,
                width: MediaQuery.of(context).size.width * 0.259),
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
                child: Text(
                  widget.task.title,
                  style: const TextStyle(fontSize: 20),
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
                child: Text(
                  widget.task.description,
                  style: const TextStyle(fontSize: 16),
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
                child: Text(
                  widget.task.date,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<TaskManager>().removeTask(widget.task);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Task Removed Successfully'),
                    ));
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text('Remove Task'),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
