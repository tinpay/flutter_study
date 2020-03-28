import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/models/task_store.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String textValue;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Add Task",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 30,
              ),
            ),
            TextFormField(
              autofocus: true,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.teal,
                  decorationColor: Colors.teal,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3.0, color: Colors.teal)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3.0, color: Colors.teal)),
              ),
              onChanged: (newText) {
                textValue = newText;
              },
            ),
            RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: Text("Add"),
              onPressed: () {
                Task task = Task(name: textValue);
                Provider.of<TaskStore>(context, listen: false).addTask(task);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
