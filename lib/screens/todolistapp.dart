import 'package:flutter/material.dart';
import 'package:todolist/screens/create_task.dart';
import 'package:todolist/screens/one_task.dart';

import 'package:todolist/screens/all_tasks.dart';
import 'package:http/http.dart' as http;

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<http.Response> fetchAlbum() {
      return http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    }

    return MaterialApp(
      title: 'To do list',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/all_tasks': (context) => const AllTasks(),
        // When navigating to the "/second" route, build the SecondScreen widget.

        '/create_task': (context) => const CreateTask(),
      },
      home: const AllTasks(),
    );
  }
}
