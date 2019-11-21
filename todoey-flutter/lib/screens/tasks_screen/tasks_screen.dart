import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/tasks_list.dart';

import 'package:todoey_flutter/screens/tasks_screen/add_task_bottom_sheet.dart';
import 'package:todoey_flutter/screens/tasks_screen/tasks_list.dart';

const double _kHeaderPadding = 25.0;
const double _kIconSize = 25.0;

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(_kHeaderPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: _kIconSize,
                    child: Icon(
                      Icons.list,
                      size: _kIconSize,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TasksList>(context).taskCount} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TasksListWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskBottomSheet(),
          );
        },
      ),
    );
  }
}
