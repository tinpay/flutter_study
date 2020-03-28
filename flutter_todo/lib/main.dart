import 'package:flutter/material.dart';
import 'package:fluttertodo/models/task_store.dart';
import 'package:fluttertodo/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskStore(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
