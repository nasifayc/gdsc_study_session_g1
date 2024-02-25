import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Provider/task.dart';

class TaskManager extends ChangeNotifier {
  static const _taskKey = 'tasks';

  late List<Task> tasks = [];

  TaskManager() {
    loadTask();
  }

  void addTask(Task item) {
    tasks.add(item);
    saveTask();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    saveTask();
  }

  void mark(Task task) {
    task.isDone = !task.isDone;
    saveTask();
  }

// Save Data To Shared_Preference Localstorage
  void saveTask() async {
    final prefs = await SharedPreferences.getInstance();
    if (tasks.isEmpty) {
      prefs.clear();
    } else {
      final List<String> taskJsonList =
          tasks.map((task) => jsonEncode(task.toJson())).toList();
      await prefs.setStringList(_taskKey, taskJsonList);
    }
    notifyListeners();
  }

// Load Data From Shared_Preferences Localstorage
  Future<void> loadTask() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? taskJsonList = prefs.getStringList(_taskKey);
    if (taskJsonList == null) {
      tasks = [];
    } else {
      tasks =
          taskJsonList.map((task) => Task.fromJson(jsonDecode(task))).toList();
    }
    notifyListeners();
  }
}
