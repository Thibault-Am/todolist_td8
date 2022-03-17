import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/all_tasks.dart';

class TaskPreview extends StatelessWidget {
  final int index;

  const TaskPreview({Key? key, required this.index})
      : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      var task = tasksCollection.listTasks[index];
      var color;
      if (task.completed == true) {
        color = Colors.green;
      } else {
        color = Colors.red;
      }
      return ListTile(
        tileColor:
            tasksCollection.isSelected(index) ? Colors.lightBlueAccent : color,
        title: Text(task.content),
        subtitle: tasksCollection.isSelected(index)
            ? Text('${task.createdAt}')
            : null,
        trailing:
            tasksCollection.isSelected(index) ? const Icon(Icons.check) : null,
        onTap: () => tasksCollection.onTap(task),
      );
    });
  }
}
