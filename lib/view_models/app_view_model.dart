import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_flutter/models/task_model.dart';

import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User('Ahmadin Zaki');

  Color clrLvl1 = Colors.grey.shade50;
  Color clrLvl2 = Colors.grey.shade200;
  Color clrLvl3 = Colors.grey.shade800;
  Color clrLvl4 = Colors.grey.shade900;

  int get numTasks => tasks.length;

  int get numTaskRemaining => tasks.where((task) => !task.complete).length;

  String get userName => user.username;

//add task
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

//delete task (sliding)
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

//delete all

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

//delete completed task
  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

//change name
  void updateUsername(String newUserName) {
    user.username = newUserName;
    notifyListeners();
  }

//Set Task that already Completed
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

//get Task
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

//Task Name
  String getTaskTile(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: ((context) {
        return bottomSheetView;
      }),
    );
  }
}
