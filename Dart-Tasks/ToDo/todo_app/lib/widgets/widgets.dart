import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/task.dart';
import 'package:todo_app/Provider/taskManager.dart';

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
    return Text(
      softWrap: true,
      text,
      style: TextStyle(
        fontSize: textFontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor,
      ),
    );
  }
}

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task;
  final int index;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.indigo,
    ];

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.task.title[0], style: const TextStyle(fontSize: 20)),
          StyledText(
              text: widget.task.title,
              textFontSize: 16,
              textColor: const Color.fromARGB(255, 124, 119, 119),
              isBold: true),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.task.date),
            ],
          ),
          Container(
            width: 6.0,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              color: colors[widget.index % 4],
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Checkbox(
            value: widget.task.isDone,
            onChanged: (value) {
              context.read<TaskManager>().mark(widget.task);
            },
          ),
        ],
      ),
    );
  }
}
