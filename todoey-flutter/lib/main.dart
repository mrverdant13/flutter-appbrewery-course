import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/tasks_list.dart';

import 'package:todoey_flutter/screens/tasks_screen/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksList>(
      builder: (context) => TasksList(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
