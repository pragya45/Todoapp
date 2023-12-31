import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super(_initialTasks);

  static final List<Task> _initialTasks = [
    Task(id: '1', title: 'Task 1'),
    Task(id: '2', title: 'Task 2'),
    Task(id: '3', title: 'Task 3'),
    Task(id: '4', title: 'Task 4'),
    Task(id: '5', title: 'Task 5'),
  ];

  void toggleTaskStatus(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return Task(id: task.id, title: task.title, isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
  }
}
