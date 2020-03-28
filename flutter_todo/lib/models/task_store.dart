import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';

class TaskStore extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "buy milk1.", isDone: false),
    Task(name: "buy milk2.", isDone: false),
    Task(name: "buy milk3.", isDone: false),
    Task(name: "buy milk4.", isDone: false),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    print("done");
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    print("delete");
    notifyListeners();
  }
}
