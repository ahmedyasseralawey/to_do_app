
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to_do_app/models/task_data.dart';
import 'package:to_do_app/widgets/tasks_list.dart';

import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(child: AddTaskScreen((newTextTitle) {
                    // setState(() {
                    //   tasks.add(Task(name: newTextTitle));
                    //   Navigator.pop(context);
                    // });
                  }))));
        },
        backgroundColor: Colors.indigo[400],
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Text(
                  "ToDayDo",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Text("${Provider.of<TaskData>(context).tasks.length} Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
