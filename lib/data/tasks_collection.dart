import 'dart:math';

import 'package:provider/provider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/models/task.dart';

class TasksCollection extends ChangeNotifier {
  var listTasks = Tasks.listTasks;
  var title = "To do list";
  Task? selectedTask;
  bool isSelected(int index) {
    return selectedTask == listTasks[index];
  }

  Widget showDetailsWhenTaskIsSelected() {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return (Provider.of<TasksCollection>(context).selectedTask != null)
          ? const TaskDetails()
          : Container();
    });
  }

  void create(String text, bool state) {
    listTasks.insert(
        0,
        Task(
          content: text,
          completed: state,
        ));
    notifyListeners();
  }

  void update(Task? task, String content, bool state) {
    task!.completed = state;
    task.content = content;
    hideDetails();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void delete(Task? task) {
    listTasks.remove(task);
    hideDetails();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void hideDetails() {
    selectedTask = null;
    //when selectedTask is null TaskDetails widget is hidden
    notifyListeners();
  }

  void onProductSelected(Task task) {
    selectedTask = task;
    //when selectedTask has a value, TaskDetails widget is displayed
    notifyListeners();
  }

  void onTap(Task task) {
    onProductSelected(task);
    notifyListeners();
  }
}
