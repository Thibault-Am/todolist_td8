import 'package:todolist/models/task.dart';
import 'dart:math';
import 'package:faker/faker.dart';

class Tasks {
  static final listTasks = List<Task>.generate(
    15,
    (index) => Task(
      content: faker.lorem.sentence(),
      completed: Random().nextBool(),
    ),
  );
}
