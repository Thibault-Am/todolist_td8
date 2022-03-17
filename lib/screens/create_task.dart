import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/components/tasks/task_form.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key}) : super(key: key);

  //affichage conditionnel

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tasksCollection.title + ": create page"),
        ),
        body: TaskForm(),
      );
    });
  }
}
