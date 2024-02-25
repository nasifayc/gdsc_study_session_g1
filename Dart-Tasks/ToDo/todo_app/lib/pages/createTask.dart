import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/taskManager.dart';
import 'package:todo_app/widgets/widgets.dart';
import '../Provider/task.dart';

class TaskCreator extends StatefulWidget {
  const TaskCreator({super.key, required this.title});

  final String title;

  @override
  State<TaskCreator> createState() => _TaskCreatorState();
}

class _TaskCreatorState extends State<TaskCreator> {
  final _formKey = GlobalKey<FormState>();
  final _mainTask = TextEditingController();
  final _description = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Request!')));
            },
            icon: Icon(
              Icons.more_vert,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  text: 'Create New Task',
                  textFontSize: 20,
                  textColor: Colors.black,
                  isBold: true),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
              // Form
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledText(
                        text: 'Title',
                        textFontSize: 18,
                        textColor: Theme.of(context).primaryColor,
                        isBold: true),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _mainTask,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Task Name is Required.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Task Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StyledText(
                        text: 'Due date',
                        textFontSize: 18,
                        textColor: Theme.of(context).primaryColor,
                        isBold: true),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText:
                            '(yy/dd/mm) --- ${selectDate.year}/${selectDate.day}/${selectDate.month}',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),

                        // Date Picker Icon
                        suffixIcon: InkWell(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: selectDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));

                            if (picked != selectDate) {
                              setState(() {
                                selectDate = picked!;
                              });
                            }
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    StyledText(
                        text: 'Description',
                        textFontSize: 18,
                        textColor: Theme.of(context).primaryColor,
                        isBold: true),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _description,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description is Required.";
                        }

                        if (value.length < 8) {
                          return "Description is too Short.";
                        }

                        return null;
                      },
                      maxLength: 40,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Task newTask = Task(
                          title: _mainTask.text.trim(),
                          description: _description.text.trim(),
                          date:
                              '(yy/dd/mm) --- ${selectDate.year}/${selectDate.day}/${selectDate.month}',
                          isDone: false);
                      // Adding the new task and add to our task list
                      Provider.of<TaskManager>(context, listen: false)
                          .addTask(newTask);
                      _mainTask.clear();
                      _description.clear();

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Task Added!'),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),
                      ));

                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    shape: const MaterialStatePropertyAll(StadiumBorder()),
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: const StyledText(
                      text: 'Add task',
                      textFontSize: 18,
                      textColor: Colors.white,
                      isBold: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
