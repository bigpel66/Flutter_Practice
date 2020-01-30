import 'dart:collection';
import 'package:flutter/material.dart';
import './task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'a1'),
    Task(name: 'a2'),
    Task(name: 'a3'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String title) {
    if (title == null) return;
    final task = Task(name: title);
    _tasks.add(task);
    notifyListeners();
  }

  void updataTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
