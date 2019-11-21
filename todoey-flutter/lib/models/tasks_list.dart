import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'package:todoey_flutter/models/task.dart';

class TasksList extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'Task 1'),
    Task(text: 'Task 2'),
    Task(text: 'Task 3'),
    Task(text: 'Task 4'),
    Task(text: 'Task 5'),
    Task(text: 'Task 6'),
    Task(text: 'Task 7'),
    Task(text: 'Task 8'),
    Task(text: 'Task 9'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTaskText) {
    _tasks.add(Task(text: newTaskText));
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  void remove(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
