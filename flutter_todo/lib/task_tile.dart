import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckbox;

  TaskTile({this.task, this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal,
        value: task.isDone,
        onChanged: toggleCheckbox,
      ),
    );
  }
}
