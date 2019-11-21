import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/tasks_list.dart';

import 'package:todoey_flutter/screens/tasks_screen/task_tile.dart';

const double _kTaskListCornerRadius = 30.0;

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_kTaskListCornerRadius),
          topRight: Radius.circular(_kTaskListCornerRadius),
        ),
      ),
      child: Consumer<TasksList>(
        builder: (context, tasksList, _) => ListView.builder(
          padding: EdgeInsets.only(
            top: _kTaskListCornerRadius,
            bottom: _kTaskListCornerRadius * 2,
          ),
          itemCount: tasksList.taskCount,
          itemBuilder: (context, taskIndex) => TaskTile(
            task: tasksList.tasks[taskIndex],
          ),
        ),
      ),
    );
  }
}
