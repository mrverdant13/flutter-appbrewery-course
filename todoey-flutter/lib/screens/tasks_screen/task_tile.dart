import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/tasks_list.dart';

const double _kTaskTileHorizontalPadding = 30.0;
const double _kTaskTextFontSize = 20.0;

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({
    @required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(
      builder: (context, taskList, _) => ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: _kTaskTileHorizontalPadding,
        ),
        title: Text(
          task.text,
          style: TextStyle(
            decoration:
                task.done ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: _kTaskTextFontSize,
          ),
        ),
        trailing: Checkbox(
          value: task.done,
          activeColor: Colors.lightBlueAccent,
          onChanged: (newState) {
            task.done = newState;
            taskList.update();
          },
        ),
        onLongPress: () {
          taskList.remove(task);
        },
      ),
    );
  }
}
