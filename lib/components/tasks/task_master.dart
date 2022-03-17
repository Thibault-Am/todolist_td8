import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

class TaskMaster extends StatelessWidget {
  TaskMaster({Key? key}) : super(key: key); //constructor
  var listTasks = Tasks.listTasks;
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Column(
        children: [
          tasksCollection.showDetailsWhenTaskIsSelected(),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.all(8.0),
            itemCount: tasksCollection.listTasks.length,
            itemBuilder: (context, index) {
              return TaskPreview(
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )),
        ],
      );
    });
  }
}
