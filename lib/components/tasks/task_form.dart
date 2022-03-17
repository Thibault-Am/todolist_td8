import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_detail.dart';
import 'package:todolist/data/tasks.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:todolist/models/task.dart';

// Define a custom Form widget.
class TaskForm extends StatefulWidget {
  TaskForm({
    Key? key,
  }) : super(key: key);
//constructor

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<TaskForm> {
  final myTask = TextEditingController();
  bool state = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTask.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, tasksCollection, child) {
      var placeholder = 'valeur';
      if (tasksCollection.selectedTask != null) {
        placeholder = tasksCollection.selectedTask!.content;
      }
      return Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            TextFormField(
              autofocus: false,
              //initialValue : 'test'
              controller: myTask,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: placeholder,
              ),
            ),
            CheckboxListTile(
                title: const Text("done"),
                value: state,
                onChanged: (bool? value) {
                  setState(() {
                    state = value!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (tasksCollection.selectedTask == null) {
                    if (myTask.text.isEmpty) {
                      final snackBar = SnackBar(
                          content: const Text('Can u put a value!'),
                          action: SnackBarAction(label: 'x', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      tasksCollection.create(myTask.text, state);
                      Navigator.pop(context);
                    }
                  } else {
                    if (myTask.text.isEmpty) {
                      final snackBar = SnackBar(
                          content: const Text('Can u put a value!'),
                          action: SnackBarAction(label: 'x', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final snackBar = SnackBar(
                          content: const Text(
                              'Are you sure you wanna delete this task!'),
                          action: SnackBarAction(
                              label: 'update',
                              onPressed: () {
                                tasksCollection.update(
                                    tasksCollection.selectedTask!,
                                    myTask.text,
                                    state);
                                Navigator.pop(context);
                              }));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ]));
    });
  }
}
