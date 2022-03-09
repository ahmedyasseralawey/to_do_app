import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {
    String? newTextTitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[400],
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) {
              newTextTitle = newText;
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(newTextTitle!);
              Navigator.pop(context);
            },
            child: Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
