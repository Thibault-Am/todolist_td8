import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/models/task.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key}) : super(key: key);

  //affichage conditionnel

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Update task'),
        ),
        body: TaskForm(),
      );
    });
  }
}
