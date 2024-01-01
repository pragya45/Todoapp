import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/features/todo/domain/entity/task.dart';

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]);

  void initializeTasks() {
    state = [
      Task(id: '1', title: 'Task 1'),
      Task(id: '2', title: 'Task 2'),
      Task(id: '3', title: 'Task 3'),
      // Add more tasks if needed
    ];
  }

  void toggleTaskStatus(String id) {
    state = state.map((task) {
      if (task.id == id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
  }
}
