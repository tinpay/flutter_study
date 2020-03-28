import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/task_store.dart';

class TaskStore extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "buy milk1.", isDone: false),
    Task(name: "buy milk2.", isDone: false),
    Task(name: "buy milk3.", isDone: false),
    Task(name: "buy milk4.", isDone: false),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String taskTitle) {
    print("aa");
    Task task = Task(name: taskTitle);
    tasks.add(task);
    notifyListeners();
  }
}
