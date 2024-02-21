import 'package:flutter/material.dart';

class Tasks {
  final String title;
  final String description;
  final String date;

  Tasks({required this.title, required this.description, required this.date});
}

class TaskCRUD extends ChangeNotifier {
  final List<Tasks> tasks = [
    Tasks(
        title: 'UI/UX Design',
        description: 'Implement The Fronted part',
        date: 'April 20, 2023'),
  ];

  void addTask(Tasks item) {
    tasks.add(item);
    notifyListeners();
  }

  void removeTask(int index) {
    if(tasks.isNotEmpty){
      tasks.removeAt(index);
      notifyListeners();
    }
  }

  
}

/*Enhance the existing To-Do list app by implementing a CRUD (Create, Read, Update, Delete) functionality using the Provider package in Flutter. 
 */

/* Tasks(
      title: 'UI/UX Design',
      description: 'Implement The Fronted part',
      date: 'April 20, 2023'),
  Tasks(
      title: 'Reading',
      description: 'Read the previous articles of ...',
      date: 'Sep 12, 2023'),
  Tasks(
      title: 'Sport',
      description: 'Go to GYM and Do some ABS workouts',
      date: 'Feb 31, 2023'),
  Tasks(
      title: 'Visit',
      description: 'Visit your grandparents.',
      date: 'Oct 20, 2023') */