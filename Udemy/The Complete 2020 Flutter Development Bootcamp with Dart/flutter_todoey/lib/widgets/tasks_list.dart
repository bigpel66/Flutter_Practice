import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './task_tile.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, int index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              callBackFunction: (checkBoxState) {
                taskData.updataTask(task);
              },
              longPressCallBackFunction: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
