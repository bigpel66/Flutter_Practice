import 'package:flutter/material.dart';
import './task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'a1'),
    Task(name: 'a2'),
    Task(name: 'a3'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          callBackFunction: (checkBoxState) {
            setState(() {
              tasks[index].isDone = checkBoxState;
            });
          },
        );
      },
    );
  }
}
