import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function callBackFunction;
  final Function longPressCallBackFunction;

  TaskTile({
    @required this.isChecked,
    @required this.taskTitle,
    @required this.callBackFunction,
    @required this.longPressCallBackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBackFunction,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) => callBackFunction(value),
      ),
    );
  }
}
