import 'package:flutter/material.dart';
import 'package:to_do_app/models/task.dart';
class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Do shopping'),
    Task(name: 'Do sport'),
    Task(name: 'Go to eat'),
  ];
  void addTask(String newTaskTitle ){
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task ){
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

}