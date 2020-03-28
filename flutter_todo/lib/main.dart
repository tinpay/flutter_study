import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task.dart';
import 'package:fluttertodo/task_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TasksScreen(),
    );
  }
}

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: "buy milk1.", isDone: false),
    Task(name: "buy milk2.", isDone: false),
    Task(name: "buy milk3.", isDone: false),
    Task(name: "buy milk4.", isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal,
                  radius: 30,
                  child: Icon(
                    Icons.format_list_bulleted,
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Todo List",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${tasks.length} Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: TaskList(tasks)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
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
            ),
            RaisedButton(
              color: Colors.teal,
              textColor: Colors.white,
              child: Text("Add"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
