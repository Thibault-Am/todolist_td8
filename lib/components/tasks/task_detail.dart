import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/one_task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    Key? key,
  }) : super(key: key);
//constructor

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      return SizedBox(
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${tasksCollection.selectedTask!.completed}',
                ),
                Text(tasksCollection.selectedTask!.content),
                Text('${tasksCollection.selectedTask!.createdAt}'),
                IconButton(
                    onPressed: () => tasksCollection.hideDetails(),
                    icon: const Icon(Icons.close)),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneTask(),
                          ),
                        ),
                    child: const Text('Update')),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text(
                            'Are you sure you wanna delete this task!'),
                        action: SnackBarAction(
                          label: 'Delete',
                          onPressed: () {
                            tasksCollection
                                .delete(tasksCollection.selectedTask);
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('Delete'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
