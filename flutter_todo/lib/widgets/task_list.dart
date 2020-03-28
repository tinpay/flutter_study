import 'package:flutter/material.dart';
import 'package:fluttertodo/main.dart';
import 'package:fluttertodo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/models/task_store.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(
      builder: (context, taskData, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskTile(
                    task: taskData.tasks[index],
                    toggleCheckbox: (value) {
                      taskData.tasks[index].toggleDone();
                    });
              },
              itemCount: taskData.taskCount,
            ),
          ),
        );
      },
    );
  }
}
