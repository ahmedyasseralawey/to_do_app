import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemCount: TaskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: TaskData.tasks[index].isDone,
              taskTitle: TaskData.tasks[index].name,
              checkboxChange: (newValue) {
                TaskData.updateTask(TaskData.tasks[index]);
              },
              listTileDelete: () {
                TaskData.deleteTask(TaskData.tasks[index]);
              },
            );
          },
        );
      },
    );
  }
}
