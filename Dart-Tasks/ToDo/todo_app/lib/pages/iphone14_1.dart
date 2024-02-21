import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'frame1.dart';
import '../Provider/taskModel.dart';

class Iphone14Body extends StatefulWidget {
  const Iphone14Body({super.key, required this.title});

  final String title;

  @override
  State<Iphone14Body> createState() => _Iphone14BodyState();
}

class _Iphone14BodyState extends State<Iphone14Body> {
  final _formKey = GlobalKey<FormState>();
  final _mainTask = TextEditingController();
  final _dueDate = TextEditingController();
  final _description = TextEditingController();

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
                  const SnackBar(content: Text('Processing Request!')));
            },
            icon: const Icon(
              Icons.more_vert,
              size: 40,
              color: Color.fromARGB(255, 215, 113, 76),
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
                  text: 'Create new task',
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
                        text: 'Main task name',
                        textFontSize: 18,
                        textColor: const Color.fromARGB(251, 255, 17, 0)
                            .withOpacity(0.5),
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
                        textColor: const Color.fromARGB(251, 255, 17, 0)
                            .withOpacity(0.5),
                        isBold: true),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _dueDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Due Date is Required.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Due Date',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: const Color.fromARGB(251, 255, 17, 0)
                              .withOpacity(0.5),
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    StyledText(
                        text: 'Description',
                        textFontSize: 18,
                        textColor: const Color.fromARGB(251, 255, 17, 0)
                            .withOpacity(0.5),
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
              height: 100,
            ),
            Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<TaskCRUD>().tasks.add(Tasks(
                          title: _mainTask.text.toString(),
                          description: _description.text.toString(),
                          date: _dueDate.text.toString()));

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Task Added!'),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),
                      ));

                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const Frame1Body('Todo List'),
                              ),
                            );
                          });
                        },
                      );
                    }
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(StadiumBorder()),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 215, 113, 76)),
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
