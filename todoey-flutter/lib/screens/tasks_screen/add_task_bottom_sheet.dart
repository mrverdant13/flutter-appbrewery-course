import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:todoey_flutter/models/tasks_list.dart';

const double _kBottomSheetCornerRadius = 20.0;

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskText;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_kBottomSheetCornerRadius),
          topRight: Radius.circular(_kBottomSheetCornerRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_kBottomSheetCornerRadius),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    newTaskText = value;
                  },
                ),
                FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (newTaskText != null && newTaskText.trim() != "")
                      Provider.of<TasksList>(context).addTask(newTaskText);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }
}
