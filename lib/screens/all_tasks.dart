import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/models/task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  //affichage conditionnel

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tasksCollection.title),
        ),
        body: TaskMaster(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/create_task'),
          tooltip: 'Add a task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
