import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckbox;
  final Function deleteTask;

  TaskTile({this.task, this.toggleCheckbox, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
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
